import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class TileMap extends PositionComponent {
  final List<List<int>> mapTemplate = [
    [0, 0, 0, 0, 0],
    [1, 1, 0, 0, 0],
    [1, 1, 0, 0, 0],
    [1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0],
  ];

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Size of each cell
    final cellSize = Vector2(50, 50);

    for (int y = 0; y < mapTemplate.length; y++) {
      for (int x = 0; x < mapTemplate[y].length; x++) {
        int tileType = mapTemplate[y][x];
        Color color;
        if (tileType == 1) {
          color = Colors.green; // Terreno
        } else {
          color = Colors.brown; // Terreno bloqueado
        }

        // Adiciona um componente na posição (x, y)
        add(
          RectangleComponent(
            position: Vector2(x * cellSize.x, y * cellSize.y),
            size: cellSize,
            paint: Paint()..color = color,
          ),
        );
      }
    }
  }

  @override
  void update(double dt) {}
}
