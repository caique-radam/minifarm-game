import 'package:flutter/material.dart';

class Hud extends StatelessWidget {
  final String playerName;
  final String playerImage;
  final int playerLevel;
  final double playerExperience; // 0.0 a 1.0 para indicar progresso
  final int playerMoney;
  final Function() onShopTap;
  final Function() onInventoryTap;
  final Function() onMapTap;

  const Hud({
    Key? key,
    required this.playerName,
    required this.playerImage,
    required this.playerLevel,
    required this.playerExperience,
    required this.playerMoney,
    required this.onShopTap,
    required this.onInventoryTap,
    required this.onMapTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Canto Superior Direito
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildClock(),
                const SizedBox(height: 10),
                Text(
                  '\$ $playerMoney',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        playerName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Nivel: $playerLevel',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: playerExperience,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.blue,
                  ),
                ],
              )),
        ),

        // Parte Inferior
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMenuButton('Loja', Icons.store, onShopTap),
                    _buildMenuButton('Inventário', Icons.store, onInventoryTap),
                    _buildMenuButton('Mapa', Icons.store, onMapTap),
                  ],
                )))
      ],
    );
  }

  // Widget para o relógio analógico
  Widget _buildClock() {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
          ),
          // Marcador de horas (simulação básica)
          Transform.rotate(
            angle: DateTime.now().hour / 12 * 3.1416 * 2,
            child: Container(
              width: 2,
              height: 20,
              color: Colors.black,
            ),
          ),
          // Marcador de minutos
          Transform.rotate(
            angle: DateTime.now().minute / 12 * 3.1416 * 2,
            child: Container(
              width: 2,
              height: 20,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // Widget para cada botão do menu inferior
  Widget _buildMenuButton(String label, IconData icon, Function() onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(icon),
          iconSize: 40,
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
