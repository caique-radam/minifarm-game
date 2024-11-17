import 'package:farm_game/game/components/plant.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/tile.dart';

class MiniFazendaGame extends FlameGame with TapDetector {
  final int tileSize = 50;
  List<List<Tile>> terreno = [];
  Plant? selectedPlant;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Inicializa o terreno com 5x5 tiles
    terreno = List.generate(
      5,
      (_) => List.generate(5, (_) => Tile(status: TileType.vazio)),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Atualiza o progresso de crescimento das plantas
    for (var linha in terreno) {
      for (var tile in linha) {
        if (tile.plant != null && !tile.plant!.isRipe) {
          tile.plant!.updateGrowingProgress(dt);
        }
      }
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Calcula a largura e altura do terreno
    final terrenoWidth = terreno[0].length * tileSize;
    final terrenoHeight = terreno.length * tileSize;

    // Calcula os deslocamentos para centralizar o terreno na tela
    final offsetX = (size.x - terrenoWidth) / 2;
    final offsetY = (size.y - terrenoHeight) / 2;

    // Renderiza cada tile aplicando os deslocamentos
    terreno.asMap().forEach((linha, lista) {
      lista.asMap().forEach((coluna, tile) {
        tile.renderTile(canvas, linha, coluna, tileSize, offsetX, offsetY);
      });
    });
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);

    // Obter a posição do toque
    final touchPosition = info.eventPosition.global;

    // Calcula o deslocamento do terreno
    final terrenoWidth = terreno[0].length * tileSize;
    final terrenoHeight = terreno.length * tileSize;
    final offsetX = (size.x - terrenoWidth) / 2;
    final offsetY = (size.y - terrenoHeight) / 2;

    // Ajusta a posição do toque com base no deslocamento
    final adjustedX = touchPosition.x - offsetX;
    final adjustedY = touchPosition.y - offsetY;

    // Verifica se o toque está dentro do terreno
    if (adjustedX < 0 ||
        adjustedY < 0 ||
        adjustedX >= terrenoWidth ||
        adjustedY >= terrenoHeight) {
      return; // Clique fora do terreno
    }

    // Calcula o índice do tile clicado
    final coluna = (adjustedX ~/ tileSize).clamp(0, terreno[0].length - 1);
    final linha = (adjustedY ~/ tileSize).clamp(0, terreno.length - 1);

    // Obtém o tile correspondente
    final tile = terreno[linha][coluna];

    // Realiza a ação no tile
    if (tile.status == TileType.vazio && selectedPlant != null) {
      tile.plantOnTile(selectedPlant!);
      selectedPlant = null; // Desmarca a planta após plantar
    } else if (tile.status == TileType.plantado) {
      tile.collectFromTile();
    }
  }
}
