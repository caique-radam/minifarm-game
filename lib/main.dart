import 'package:farm_game/game/mini_fazenda_game.dart';
import 'package:farm_game/ui/hud.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MiniFazendaApp());
}

class MiniFazendaApp extends StatelessWidget {
  const MiniFazendaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MiniFazendaGame game = MiniFazendaGame();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget(game: game),
            Hud(
              playerName: 'Fazendeiro', // Nome do jogador
              playerImage: 'assets/images/player.png', // Caminho da imagem
              playerLevel: 1, // Nível do jogador
              playerExperience: 0.3, // Progresso da experiência (0.0 a 1.0)
              playerMoney: 150, // Dinheiro do jogador
              onShopTap: () {
                print('Abrir Loja');
              },
              onInventoryTap: () {
                print('Abrir Inventário');
              },
              onMapTap: () {
                print('Abrir Mapa');
              },
            ),
          ],
        ),
      ),
    );
  }
}
