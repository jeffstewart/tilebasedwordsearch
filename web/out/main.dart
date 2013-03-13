// Auto-generated from index.html.
// DO NOT EDIT.

library index_html;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'dart:html';
import 'package:game_loop/game_loop.dart';
import 'package:asset_pack/asset_pack.dart';
import 'package:tilebasedwordsearch/dictionary.dart';
import 'package:tilebasedwordsearch/game.dart';


// Original code


CanvasElement _canvasElement;
GameLoop _gameLoop;
AssetManager assetManager = new AssetManager();
Dictionary dictionary;
Game game;

void initialize() {
  dictionary = new Dictionary.fromFile(assetManager['game.dictionary']);
}

void startNewGame() {
  game = new Game();
}

bool f = true;
void gameUpdate(GameLoop gameLoop) {
  // Game logic goes here.
  if (f) {
    print(assetManager['game.dictionary']);
    f = false;
  }
}

void gameRender(GameLoop gameLoop) {
  // Paint here.
}

main() {
  _canvasElement = query('#frontBuffer');
  _gameLoop = new GameLoop(_canvasElement);
  _gameLoop.onUpdate = gameUpdate;
  _gameLoop.onRender = gameRender;
  assetManager.loadPack('game', 'assets.pack')
      .then((_) => initialize())
      .then((_) => _gameLoop.start());
}

// Additional generated code
void init_autogenerated() {
  var _root = autogenerated.document.body;
  var __e0, __frontBuffer;
  var __t = new autogenerated.Template(_root);
  __frontBuffer = _root.query('#frontBuffer');
  __e0 = _root.query('#__e-0');
  __t.listen(__e0.onClick, ($event) { startNewGame(); });
  __t.create();
  __t.insert();
}

//@ sourceMappingURL=main.dart.map