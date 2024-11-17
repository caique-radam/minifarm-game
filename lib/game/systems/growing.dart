import 'dart:async';

import 'package:farm_game/game/components/tile.dart';

class GrowingSystem {
  static void startGrowing(Tile tile, int tempoCrescimento) {
    Timer(Duration(seconds: tempoCrescimento), () {
      if (tile.status == TileType.plantado) {
        tile.status = TileType.colhido;
        print("Crescimento completo!");
      }
    });
  }
}
