import 'dart:async';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';

const int rows = 50;
const int cols = 20;
const Duration tickDurationInitial = Duration(milliseconds: 500);

typedef Matrix = List<List<int>>;

@RoutePage()
class TetrisGameScreen extends StatefulWidget {
  const TetrisGameScreen({super.key});

  @override
  State<TetrisGameScreen> createState() => _TetrisGameScreenState();
}

class _TetrisGameScreenState extends State<TetrisGameScreen> {
  late List<List<Color?>> board; // null = empty
  Tetromino? active;
  Point<int> position = const Point(3, 0); // column, row
  Timer? ticker;
  Duration tickDuration = tickDurationInitial;
  int score = 0;
  bool gameOver = false;
  final Random _rand = Random();
           // parameterize cell size
 double cellSize = 16;
 double cellMargin = 1; // same as original margin in _buildCell

// compute total width/height including internal padding
 double ? boardWidth ;
 double ? boardHeight;

  @override
  void initState() {
    super.initState();
    _newBoard();
    _spawnPiece();
    _startTicker();
     // request focus so keyboard works immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
boardWidth = cols * (cellSize + 2 * cellMargin);
 boardHeight = rows * (cellSize + 2 * cellMargin);
  }
    final FocusNode _focusNode = FocusNode();

  void _handleKey(KeyEvent event) {
    if (event is! KeyEvent) return; // only on key down
    final isWebOrDesktop = true; // RawKey works cross-platform; adapt if needed
    final key = event.logicalKey;

    if (gameOver) return;

    if (key == LogicalKeyboardKey.arrowLeft) {
      _moveLeft();
    } else if (key == LogicalKeyboardKey.arrowRight) {
      _moveRight();
    } else if (key == LogicalKeyboardKey.arrowDown) {
      _drop();
    } else if (key == LogicalKeyboardKey.space) {
      _hardDrop();
    } else if (key == LogicalKeyboardKey.arrowUp || key == LogicalKeyboardKey.keyX) {
      _rotate();
    }
  }

  void _newBoard() {
    board = List.generate(rows, (_) => List.generate(cols, (_) => null));
    score = 0;
    gameOver = false;
  }

  void _startTicker() {
    ticker?.cancel();
    ticker = Timer.periodic(tickDuration, (_) {
      _drop();
    });
  }

  void _spawnPiece() {
    active = Tetromino.random(_rand);
    position = const Point(3, 0);
    if (!_isValid(position, active!)) {
      setState(() {
        gameOver = true;
        ticker?.cancel();
      });
    }
  }

  bool _isValid(Point<int> pos, Tetromino tet) {
    for (int y = 0; y < tet.matrix.length; y++) {
      for (int x = 0; x < tet.matrix[y].length; x++) {
        if (tet.matrix[y][x] == 0) continue;
        int boardX = pos.x + x;
        int boardY = pos.y + y;
        if (boardX < 0 || boardX >= cols || boardY < 0 || boardY >= rows) return false;
        if (board[boardY][boardX] != null) return false;
      }
    }
    return true;
  }

  void _lockPiece() {
    if (active == null) return;
    for (int y = 0; y < active!.matrix.length; y++) {
      for (int x = 0; x < active!.matrix[y].length; x++) {
        if (active!.matrix[y][x] != 0) {
          int bx = position.x + x;
          int by = position.y + y;
          if (by >= 0 && by < rows && bx >= 0 && bx < cols) {
            board[by][bx] = active!.color;
          }
        }
      }
    }
    _clearLines();
    _spawnPiece();
  }

  void _clearLines() {
    int linesCleared = 0;
    for (int y = rows - 1; y >= 0; y--) {
      if (board[y].every((cell) => cell != null)) {
        board.removeAt(y);
        board.insert(0, List.generate(cols, (_) => null));
        linesCleared += 1;
        y++; // recheck same row after shift
      }
    }
    if (linesCleared > 0) {
      score += (linesCleared * linesCleared) * 100; // simple scoring
      // speed up slightly
      tickDuration = Duration(milliseconds: max(100, tickDuration.inMilliseconds - 15 * linesCleared));
      _startTicker();
    }
  }

  void _drop() {
    if (gameOver) return;
    final newPos = Point(position.x, position.y + 1);
    if (_isValid(newPos, active!)) {
      setState(() {
        position = newPos;
      });
    } else {
      setState(() {
        _lockPiece();
      });
    }
  }

  void _moveLeft() {
    final newPos = Point(position.x - 1, position.y);
    if (_isValid(newPos, active!)) {
      setState(() {
        position = newPos;
      });
    }
  }

  void _moveRight() {
    final newPos = Point(position.x + 1, position.y);
    if (_isValid(newPos, active!)) {
      setState(() {
        position = newPos;
      });
    }
  }

  void _rotate() {
    if (active == null) return;
    final rotated = active!.rotated();
    if (_isValid(position, rotated)) {
      setState(() {
        active = rotated;
      });
    }
  }

  void _hardDrop() {
    while (!_isValid(Point(position.x, position.y + 1), active!)) break;
    while (_isValid(Point(position.x, position.y + 1), active!)) {
      position = Point(position.x, position.y + 1);
    }
    setState(() {
      _lockPiece();
    });
  }

  void _reset() {
    setState(() {
      _newBoard();
      tickDuration = tickDurationInitial;
      _spawnPiece();
      _startTicker();
    });
  }

  @override
  void dispose() {
    ticker?.cancel();
        _focusNode.dispose();

    super.dispose();
  }

  Widget _buildCell(int y, int x) {
    Color? color = board[y][x];
    // overlay active piece
    if (active != null) {
      final relY = y - position.y;
      final relX = x - position.x;
      if (relY >= 0 && relY < active!.matrix.length && relX >= 0 && relX < active!.matrix[0].length && active!.matrix[relY][relX] != 0) {
        color = active!.color;
      }
    }
     return Container(
    decoration: BoxDecoration(
      color: color ?? AppColors.backgroundBase,
      border: Border.all(color: AppColors.textBase.withOpacity(0.1), width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
  );
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
      body: KeyboardListener(
        focusNode: _focusNode,
        onKeyEvent: _handleKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header / info
              Wrap(children: [Text('Score: $score', style: const TextStyle(fontWeight: FontWeight.bold))]),
              const SizedBox(height: 8),
             
        
        SizedBox(
          width: boardWidth,
          height: boardHeight,
          child: AspectRatio(
            aspectRatio: cols / rows,
            child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.textBase.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rows * cols,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final y = index ~/ cols;
                final x = index % cols;
                return SizedBox(
                  width: cellSize,
                  height: cellSize,
                  child: _buildCell(y, x),
                );
              },
            ),
            if (gameOver)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Game Over', style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
          ],
        ),
            ),
          ),
        ),
              const SizedBox(height: 8),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: _moveLeft, icon: const Icon(Icons.arrow_left)),
                  IconButton(onPressed: _rotate, icon: const Icon(Icons.rotate_right)),
                  IconButton(onPressed: _moveRight, icon: const Icon(Icons.arrow_right)),
                  IconButton(onPressed: _drop, icon: const Icon(Icons.arrow_downward)),
                  IconButton(onPressed: _hardDrop, icon: const Icon(Icons.vertical_align_bottom)),
                ],
              ),
              SizedBox(height: 20), ElevatedButton(onPressed: _reset, style: ElevatedButton.styleFrom(backgroundColor: AppColors.accentPeach), child: const Text('Restart')),
        
              // Controls
             ],
          ),
        ),
      ),
    );
  }
}

class Tetromino {
  final Matrix matrix;
  final Color color;

  Tetromino(this.matrix, this.color);

  Tetromino rotated() {
    final rows = matrix.length;
    final cols = matrix[0].length;
    Matrix newMatrix = List.generate(cols, (_) => List.generate(rows, (_) => 0));
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        newMatrix[x][rows - 1 - y] = matrix[y][x];
      }
    }
    return Tetromino(newMatrix, color);
  }

  static final List<Tetromino> _templates = [
    // I
    Tetromino([
      [1, 1, 1, 1],
    ], Colors.cyan),
    // O
    Tetromino([
      [1, 1],
      [1, 1],
    ], Colors.yellow),
    // T
    Tetromino([
      [0, 1, 0],
      [1, 1, 1],
    ], Colors.purple),
    // S
    Tetromino([
      [0, 1, 1],
      [1, 1, 0],
    ], Colors.green),
    // Z
    Tetromino([
      [1, 1, 0],
      [0, 1, 1],
    ], Colors.red),
    // J
    Tetromino([
      [1, 0, 0],
      [1, 1, 1],
    ], Colors.blue),
    // L
    Tetromino([
      [0, 0, 1],
      [1, 1, 1],
    ], Colors.orange),
  ];

  static Tetromino random(Random r) {
    final template = _templates[r.nextInt(_templates.length)];
    // deep copy matrix
    final copied = template.matrix.map((row) => List<int>.from(row)).toList();
    return Tetromino(copied, template.color);
  }
}
