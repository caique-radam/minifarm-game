import 'package:farm_game/game/systems/tile_map.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class FarmGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(HudButtonComponent());
    add(TileMap()); // Adiciona um componente ao jogo
  }
}
