import 'dart:math';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';

@RoutePage()
class WordleGameScreen extends StatefulWidget {
  const WordleGameScreen({super.key});

  @override
  State<WordleGameScreen> createState() => _WordleGameState();
}

class _WordleGameState extends State<WordleGameScreen> {
  static const int maxRows = 6;
  static const int wordLength = 5;

  // Minimal word list; expand as needed
  static const List<String> _solutions = [
    'FLUTE',
    'APPLE',
    'STATE',
    'BRAVE',
    'LIGHT',
    'WORLD',
    'CODEY',
    'DEBUG',
    'STACK',
    'QUERY',
  ];

  late String _solution;
  List<String> _guesses = [];
  String _current = '';
  String _status = 'Guess the 5-letter word';
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _pickSolution();
  }

  void _pickSolution() {
    final rand = Random();
    _solution = _solutions[rand.nextInt(_solutions.length)];
    _guesses = [];
    _current = '';
    _status = 'Guess the 5-letter word';
    _finished = false;
    setState(() {});
  }

  void _submitGuess() {
    if (_finished) return;
    if (_current.length != wordLength) return;
    final guess = _current.toUpperCase();
    setState(() {
      _guesses.add(guess);
      if (guess == _solution) {
        _status = 'You got it! 🎉';
        _finished = true;
      } else if (_guesses.length >= maxRows) {
        _status = 'Out of attempts. Word was $_solution';
        _finished = true;
      } else {
        _status = 'Keep trying...';
      }
      _current = '';
    });
  }

  void _onKeyTap(String key) {
    if (_finished) return;
    if (key == 'ENTER') {
      _submitGuess();
    } else if (key == 'DEL') {
      if (_current.isNotEmpty) {
        setState(() {
          _current = _current.substring(0, _current.length - 1);
        });
      }
    } else {
      if (_current.length < wordLength) {
        setState(() {
          _current += key;
        });
      }
    }
  }

  List<LetterEvaluation> _evaluate(String guess) {
    final solChars = _solution.split('');
    final guessChars = guess.split('');
    final result = List<LetterEvaluation>.filled(wordLength, LetterEvaluation.absent);

    // First pass: correct spot
    for (int i = 0; i < wordLength; i++) {
      if (guessChars[i] == solChars[i]) {
        result[i] = LetterEvaluation.correct;
        solChars[i] = ''; // mark used
      }
    }

    // Second pass: exists elsewhere
    for (int i = 0; i < wordLength; i++) {
      if (result[i] == LetterEvaluation.correct) continue;
      if (solChars.contains(guessChars[i])) {
        result[i] = LetterEvaluation.present;
        solChars[solChars.indexOf(guessChars[i])] = ''; // mark used
      }
    }

    return result;
  }

  Color _colorForEval(LetterEvaluation eval) {
    switch (eval) {
      case LetterEvaluation.correct:
        return Colors.green.shade600;
      case LetterEvaluation.present:
        return Colors.yellow.shade700;
      case LetterEvaluation.absent:
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        centerTitle: true,
        title: InkWell(onTap: () => context.router.pop(), child: BrutalismContainer(child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16))),
      ),
      body: Center(
        child: SizedBox(
          width: figmaScreenWidth,
          child: BrutalismContainer(
            topBorderBold: true,
            bottomBorderBold: true,
            color: AppColors.backgroundBase,
            borderRadius: 14,
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Wrap(
                    children: [
                      const Text('Wordle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                     
                    
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(_status),
                  const SizedBox(height: 16),
                  // Grid of guesses
                  Column(
                    children: List.generate(maxRows, (row) {
                      String display;
                      List<LetterEvaluation> evals = List.filled(wordLength, LetterEvaluation.empty);
                      if (row < _guesses.length) {
                        display = _guesses[row];
                        evals = _evaluate(display);
                      } else if (row == _guesses.length) {
                        display = _current.padRight(wordLength);
                      } else {
                        display = ' ' * wordLength;
                      }
                        
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(wordLength, (i) {
                            final char = display[i];
                            final isCurrentRow = row == _guesses.length;
                            final bgColor = row < _guesses.length
                                ? _colorForEval(evals[i])
                                : isCurrentRow && i < _current.length
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade200;
                            return Container(
                              margin: const EdgeInsets.all(4),
                              width: 48,
                              height: 56,
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: AppColors.textBase.withOpacity(0.5)),
                              ),
                              child: Center(
                                child: Text(
                                  char.trim(),
                                  style: const TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: _pickSolution,
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.accentPeach),
                        child: const Text('Restart'),
                      ),
                  // Keyboard
                  _Keyboard(onKeyTap: _onKeyTap),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum LetterEvaluation { correct, present, absent, empty }

class _Keyboard extends StatelessWidget {
  final void Function(String) onKeyTap;

  const _Keyboard({required this.onKeyTap});

  static const List<String> _rows = [
    'QWERTYUIOP',
    'ASDFGHJKL',
    'ZXCVBNM',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var row in _rows)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.split('').map((letter) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: SizedBox(
                    width: 30,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => onKeyTap(letter),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary.shade100,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(letter),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => onKeyTap('ENTER'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentYellow.shade400,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                child: const Text('Enter'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () => onKeyTap('DEL'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentPeach.shade400,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                child: const Text('Delete'),
              ),
            ),
          ],
        )
      ],
    );
  }
}