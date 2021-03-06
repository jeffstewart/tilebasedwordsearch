part of tilebasedwordsearch;

@observable
class Game {
  
  static const DIMENSIONS = 4;
  static const List<String> LETTERS = const ['A', 'B', 'C', 'D', 'E', 'F',
                                             'G', 'H', 'I', 'J', 'I', 'J',
                                             'K', 'L', 'M', 'N', 'O', 'P', 
                                             'QU', 'R', 'S', 'T', 'U', 'V',
                                             'W', 'X', 'Y', 'Z'];
  List<List<String>> grid = new List.generate(4, (_) => new List<String>(4));
  int score = 0;
  Dictionary dictionary;
  List<String> words = <String>[];
  
  Game(this.dictionary) {
    _assignCharsToTiles();
  }
  
  void _assignCharsToTiles() {
    Random random = new Random();
    for (var i = 0; i < DIMENSIONS; i++) {
      for (var j = 0; j < DIMENSIONS; j++) {
        this.grid[i][j] = LETTERS[random.nextInt(LETTERS.length)];
      }
    }
  }
  
  bool validPath(position1, position2) {
    bool validPath = true;
    
    if (!_vertical(position1, position2) && 
        !_horizontal(position1, position2) &&
        !_diagonal(position1, position2)) {
      validPath = false;
    }
    return validPath;
  }

// Args are GameLoopTouchPosition(s).
  bool _vertical(position1, position2) => position1.x == position2.x;

  bool _horizontal(position1, position2) => position1.y == position2.y;

  bool _diagonal(position1, position2) {
    return ((position1.x - position2.y).abs() == 1 && 
        (position1.y - position2.x).abs()) &&
        !(position1.x == position2.x && position1.x == position2.x);
  }
 
  bool attemptWord(String word) {
    if (_wordIsValid(word)) {
      score += word.length;
      words.add(word);
    }
  }
  
  bool _wordIsValid(String word) => dictionary.hasWord(word);
}