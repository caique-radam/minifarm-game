import 'package:flutter/material.dart';

import './plant.dart';

enum TileType { vazio, plantado, colhido }

class Tile {
  TileType status;
  Plant? plant;

  Tile({required this.status, this.plant});

  void plantOnTile(Plant seed) {
    if (status == TileType.vazio) {
      plant = seed;
      status = TileType.plantado;
      print("Você plantou uma ${plant!.name}!");
    }
  }

  void collectFromTile() {
    if (plant != null && plant!.isRipe) {
      print("Você colheu uma ${plant!.name}!");
      plant = null;
      status = TileType.vazio;
    } else {
      print("Nada para colher ou planta ainda não está pronta.");
    }
  }

  void renderTile(Canvas canvas, int linha, int coluna, int tileSize,
      double offsetX, double offsetY) {
    final paint = Paint()..color = _determineColor();

    canvas.drawRect(
      Rect.fromLTWH(
        offsetX + coluna * tileSize.toDouble(), // Adiciona o deslocamento X
        offsetY + linha * tileSize.toDouble(), // Adiciona o deslocamento Y
        tileSize.toDouble(),
        tileSize.toDouble(),
      ),
      paint,
    );
  }

  Color _determineColor() {
    if (status == TileType.vazio) {
      return Colors.brown; // Cor para um tile vazio
    } else if (status == TileType.plantado && plant != null) {
      final progresso = plant!.growingProgress / plant!.timeToGrow;
      return Color.lerp(Colors.brown, Colors.green, progresso.clamp(0.0, 1.0))!;
    } else if (status == TileType.colhido) {
      return Colors.yellow; // Cor para um tile colhido
    }
    return Colors.grey; // Cor padrão de fallback
  }
}
