import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import '../sound_manager.dart';

class GameScreen extends StatefulWidget {
  final String difficulty;

  const GameScreen({super.key, required this.difficulty});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late int numPairs;
  late int crossAxisCount;
  late List<Color> _colors;
  late List<bool> _revealed;
  int? _firstSelected;
  int score = 0;

  final Set<int> _matchedIndices = {};
  AudioPlayer? _bgMusicPlayer;
  AudioPlayer? _winPlayer;
  ConfettiController? _confettiController;

  late Timer _timer;
  int _seconds = 0;
  bool _hasTimerStopped = false;

  final Color backgroundColor = const Color(0xFF070022);

  @override
  void initState() {
    super.initState();
    _bgMusicPlayer = AudioPlayer();
    _winPlayer = AudioPlayer();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));

    _startBackgroundMusic();
    _configureLevel();
    _generateBoard();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!_hasTimerStopped) {
        setState(() {
          _seconds++;
        });
      }
    });
  }

  Future<void> _startBackgroundMusic() async {
    await _bgMusicPlayer!.setReleaseMode(ReleaseMode.loop);
    await _bgMusicPlayer!.play(AssetSource('sounds/background.mp3'));
  }

  void _configureLevel() {
    switch (widget.difficulty.toLowerCase()) {
      case 'medium':
        numPairs = 10;
        crossAxisCount = 5;
        break;
      case 'hard':
        numPairs = 12;
        crossAxisCount = 6;
        break;
      case 'easy':
      default:
        numPairs = 8;
        crossAxisCount = 4;
        break;
    }
  }

  void _generateBoard() {
    List<Color> baseColors = [
      Colors.redAccent,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.yellowAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.tealAccent,
      Colors.pinkAccent,
      Colors.cyanAccent,
      Colors.limeAccent,
      Colors.indigoAccent,
      Colors.amberAccent,
    ];

    _colors = [...baseColors.take(numPairs), ...baseColors.take(numPairs)];
    _colors.shuffle();

    _revealed = List.generate(_colors.length, (_) => false);
  }

  void _onTileTap(int index) async {
    if (_revealed[index]) return;

    await SoundManager.playClick();

    setState(() {
      _revealed[index] = true;
    });

    if (_firstSelected == null) {
      _firstSelected = index;
    } else {
      final secondSelected = index;
      if (_colors[_firstSelected!] != _colors[secondSelected]) {
        Future.delayed(const Duration(milliseconds: 800), () {
          setState(() {
            _revealed[_firstSelected!] = false;
            _revealed[secondSelected] = false;
            _firstSelected = null;
          });
        });
      } else {
        await SoundManager.playMatch();
        _confettiController?.play();

        setState(() {
          _matchedIndices.addAll([_firstSelected!, secondSelected]);
          score += 10;
          _firstSelected = null;
        });
      }
    }
  }

  bool get _hasWon => _revealed.every((r) => r);

  void _handleWin() async {
    _hasTimerStopped = true;
    _timer.cancel();

    await _bgMusicPlayer?.stop();
    await _winPlayer?.play(AssetSource('sounds/win.mp3'));

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: backgroundColor,
        title: const Text("🎉 ¡Felicidades!", style: TextStyle(color: Colors.white)),
        content: Text(
          "Completaste el nivel ${widget.difficulty}\n"
          "⏱️ Tiempo: ${_formatTime(_seconds)}",
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: Colors.cyanAccent)),
          )
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (_hasWon) {
      Future.microtask(() => _handleWin());
    }

    return Stack(
      children: [
        Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            title: Text(
              '🎮 Level: ${widget.difficulty}',
              style: const TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: backgroundColor,
            elevation: 0,
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              Text('⭐ Puntuación: $score',
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              Text('⏱️ Tiempo: ${_formatTime(_seconds)}',
                  style: const TextStyle(fontSize: 18, color: Colors.white70)),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _colors.length,
                  itemBuilder: (context, index) {
                    final isMatched = _matchedIndices.contains(index);

                    return GestureDetector(
                      onTap: () => _onTileTap(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        decoration: BoxDecoration(
                          color: _revealed[index]
                              ? _colors[index]
                              : Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white10),
                          boxShadow: isMatched
                              ? [
                                  BoxShadow(
                                    color: _colors[index].withOpacity(0.9),
                                    blurRadius: 15,
                                    spreadRadius: 3,
                                  )
                                ]
                              : [],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController!,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            gravity: 0.4,
            emissionFrequency: 0.05,
            numberOfParticles: 25,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _bgMusicPlayer?.stop();
    _bgMusicPlayer?.dispose();
    _winPlayer?.dispose();
    _confettiController?.dispose();
    _timer.cancel();
    super.dispose();
  }
}
