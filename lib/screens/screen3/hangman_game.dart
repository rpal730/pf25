import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';

enum HangmanDifficulty { easy, hard }

@RoutePage()
class HangmanGameScreen extends StatefulWidget {
  const HangmanGameScreen({super.key});

  @override
  State<HangmanGameScreen> createState() => _HangmanGameState();
}

class _HangmanGameState extends State<HangmanGameScreen> {
  static final Map<HangmanDifficulty, List<String>> _wordPools = {
    HangmanDifficulty.easy: [
      'FLUTTER',
      'DART',
      'CODE',
      'WIDGET',
      'STATE',
      'HOME',
      'GRID',
      'STACK',
    ],
    HangmanDifficulty.hard: [
      'ASYNC',
      'COMPOSITE',
      'REFACTOR',
      'OPTIMIZATION',
      'INHERITANCE',
      'DELEGATION',
      'DEPENDENCY',
      'ARCHITECTURE',
    ],
  };

  late String _targetWord;
  Set<String> _guessed = {};
  int _wrong = 0;
  HangmanDifficulty _difficulty = HangmanDifficulty.easy;
  String _status = 'Start guessing!';
  bool _finished = false;

  static const int maxWrong = 6; // classic 6-part hangman

  @override
  void initState() {
    super.initState();
    _reset();
  }

  void _reset() {
    final pool = _wordPools[_difficulty]!;
    pool.shuffle();
    _targetWord = pool.first;
    _guessed.clear();
    _wrong = 0;
    _finished = false;
    _status = 'Start guessing!';
    setState(() {});
  }

  void _guess(String letter) {
    if (_finished) return;
    letter = letter.toUpperCase();
    if (_guessed.contains(letter)) return;
    setState(() {
      _guessed.add(letter);
      if (!_targetWord.contains(letter)) {
        _wrong += 1;
      }
      _evaluate();
    });
  }

  void _evaluate() {
    final masked = _displayWord();
    if (!masked.contains('_')) {
      _finished = true;
      _status = 'You win! 🎉';
    } else if (_wrong >= maxWrong) {
      _finished = true;
      _status = 'You lost. Word: $_targetWord';
    } else {
      _status = 'Wrong: $_wrong / $maxWrong';
    }
  }

  String _displayWord() {
    return _targetWord
        .split('')
        .map((c) => _guessed.contains(c) ? c : '_')
        .join(' ');
  }

  Widget _buildGallows() {
    // simplistic text-based hangman drawing
    List<String> parts = [
      '''
  +---+
  |   |
      |
      |
      |
=======''',
      '''
  +---+
  |   |
  O   |
      |
      |
=======''',
      '''
  +---+
  |   |
  O   |
  |   |
      |
=======''',
      '''
  +---+
  |   |
  O   |
 /|   |
      |
=======''',
      '''
  +---+
  |   |
  O   |
 /|\\  |
      |
=======''',
      '''
  +---+
  |   |
  O   |
 /|\\  |
 /    |
=======''',
      '''
  +---+
  |   |
  O   |
 /|\\  |
 / \\  |
=======''',
    ];
    return Text(
      parts[_wrong.clamp(0, maxWrong)],
      style: const TextStyle(fontFamily: 'Courier', height: 1.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        centerTitle: true,
        title: InkWell(
          onTap: () => context.router.pop(),
          child: BrutalismContainer(
            child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: figmaScreenWidth,
          child: BrutalismContainer(
            topBorderBold: true,
            bottomBorderBold: true,
            color: AppColors.secondary.shade50,
            borderRadius: 14,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Difficulty selector + reset
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    const Text(
                      'Difficulty:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    _DifficultyChip(
                      label: 'Easy',
                      selected: _difficulty == HangmanDifficulty.easy,
                      onTap: () {
                        setState(() {
                          _difficulty = HangmanDifficulty.easy;
                          _reset();
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    _DifficultyChip(
                      label: 'Hard',
                      selected: _difficulty == HangmanDifficulty.hard,
                      onTap: () {
                        setState(() {
                          _difficulty = HangmanDifficulty.hard;
                          _reset();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Gallows and word
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gallows
                    _buildGallows(),
                    const SizedBox(width: 24),
                    // Word and status
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _displayWord(),
                            style: const TextStyle(
                              fontSize: 32,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(_status),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Letter buttons
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children:
                      'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((l) {
                        final used = _guessed.contains(l);
                        return SizedBox(
                          width: 36,
                          height: 36,
                          child: ElevatedButton(
                            onPressed:
                                used || _finished ? null : () => _guess(l),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  used
                                      ? AppColors.neutralLight
                                      : AppColors.primary.shade100,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(
                                  color: AppColors.textBase,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              l,
                              style: TextStyle(
                                color:
                                    used
                                        ? Colors.grey[600]
                                        : AppColors.textBase,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
                if (_finished)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      _status,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color:
                            _status.startsWith('You win')
                                ? Colors.green
                                : Colors.red,
                      ),
                    ),
                  ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentPeach,
                  ),
                  child: const Text('Restart'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _DifficultyChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              selected ? AppColors.primary.shade200 : AppColors.backgroundBase,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.textBase, width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                selected
                    ? AppColors.textBase
                    : AppColors.textBase.withOpacity(0.75),
          ),
        ),
      ),
    );
  }
}
