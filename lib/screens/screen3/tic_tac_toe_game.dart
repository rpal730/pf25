import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:flutter_web_portfolio_2025/screens/dashboard/view/dashboard.dart';

enum Difficulty { easy, hard }

@RoutePage()
class TicTacToeGameScreen extends StatefulWidget {
  const TicTacToeGameScreen({super.key});

  @override
  State<TicTacToeGameScreen> createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGameScreen> {
  static const String player = 'X';
  static const String ai = 'O';

  List<String?> board = List.filled(9, null);
  Difficulty difficulty = Difficulty.hard;
  String status = 'Your turn';
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
  }

  void reset() {
    setState(() {
      board = List.filled(9, null);
      status = 'Your turn';
      gameOver = false;
    });
  }

  void playerMove(int idx) {
    if (gameOver || board[idx] != null) return;
    setState(() {
      board[idx] = player;
    });
    _evaluateAfterMove();
    if (!gameOver) {
      Future.delayed(const Duration(milliseconds: 300), aiMove);
    }
  }

  void aiMove() {
    if (gameOver) return;
    int move;
    if (difficulty == Difficulty.easy) {
      move = _randomMove();
    } else {
      move = _bestMove();
    }
    if (move != -1) {
      setState(() {
        board[move] = ai;
      });
    }
    _evaluateAfterMove();
  }

  void _evaluateAfterMove() {
    final winner = _checkWinner(board);
    if (winner != null) {
      setState(() {
        gameOver = true;
        status =
            winner.winner == player
                ? 'You win!'
                : (winner.winner == ai ? 'AI wins!' : 'Draw');
      });
    } else if (!board.contains(null)) {
      setState(() {
        gameOver = true;
        status = 'Draw';
      });
    } else {
      setState(() {
        status =
            board.where((e) => e == player).length <=
                    board.where((e) => e == ai).length
                ? 'Your turn'
                : 'AI thinking...';
      });
    }
  }

  int _randomMove() {
    final empty = <int>[];
    for (int i = 0; i < 9; i++) {
      if (board[i] == null) empty.add(i);
    }
    if (empty.isEmpty) return -1;
    empty.shuffle();
    return empty.first;
  }

  int _bestMove() {
    // minimax
    final result = _minimax(List<String?>.from(board), ai);
    return result.index;
  }

  WinnerResult? _checkWinner(List<String?> b) {
    const lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var line in lines) {
      final a = b[line[0]];
      final c = b[line[1]];
      final d = b[line[2]];
      if (a != null && a == c && a == d) {
        return WinnerResult(winner: a);
      }
    }
    if (!b.contains(null)) {
      return WinnerResult(winner: null); // draw
    }
    return null;
  }

  MinimaxResult _minimax(List<String?> b, String current) {
    final winnerRes = _checkWinner(b);
    if (winnerRes != null) {
      if (winnerRes.winner == ai) return MinimaxResult(score: 10);
      if (winnerRes.winner == player) return MinimaxResult(score: -10);
      return MinimaxResult(score: 0);
    }

    final moves = <MinimaxResult>[];
    for (int i = 0; i < 9; i++) {
      if (b[i] == null) {
        b[i] = current;
        final result = _minimax(b, current == ai ? player : ai);
        moves.add(MinimaxResult(index: i, score: result.score));
        b[i] = null;
      }
    }

    MinimaxResult best;
    if (current == ai) {
      // maximize
      best = moves.reduce((a, b) => a.score > b.score ? a : b);
    } else {
      // minimize
      best = moves.reduce((a, b) => a.score < b.score ? a : b);
    }
    return best;
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
            color: AppColors.backgroundBase,
            borderRadius: 14,
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Difficulty selector + status
                  Wrap(
                    children: [
                      const Text(
                        'Difficulty:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 12),
                      _DifficultyRadio(
                        label: 'Easy',
                        value: Difficulty.easy,
                        group: difficulty,
                        onChanged: (v) {
                          setState(() {
                            difficulty = v!;
                            reset();
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      _DifficultyRadio(
                        label: 'Hard',
                        value: Difficulty.hard,
                        group: difficulty,
                        onChanged: (v) {
                          setState(() {
                            difficulty = v!;
                            reset();
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Grid
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textBase, width: 3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                            ),
                        itemBuilder: (context, i) {
                          final val = board[i];
                          return GestureDetector(
                            onTap: () => playerMove(i),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColors.textBase,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  val ?? '',
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        val == player
                                            ? AppColors.primary.shade700
                                            : AppColors.accentPeach,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 12),
                  Text(
                    status,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentPeach,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    onPressed: reset,
                    child: const Text('Restart'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DifficultyRadio extends StatelessWidget {
  final String label;
  final Difficulty value;
  final Difficulty group;
  final ValueChanged<Difficulty?> onChanged;

  const _DifficultyRadio({
    required this.label,
    required this.value,
    required this.group,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selected = value == group;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Radio<Difficulty>(
            value: value,
            groupValue: group,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
          Text(label),
          if (selected) const SizedBox(width: 4),
        ],
      ),
    );
  }
}

class MinimaxResult {
  final int score;
  final int index;
  MinimaxResult({this.score = 0, this.index = -1});
}

class WinnerResult {
  final String? winner; // 'X', 'O', or null for draw
  WinnerResult({this.winner});
}
