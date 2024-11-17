import 'package:farm_game/game/components/plant.dart';
import 'package:flutter/material.dart';

class MiniFazendaMenu extends StatelessWidget {
  final Function(Plant) onSelectPlant;

  const MiniFazendaMenu({
    Key? key,
    required this.onSelectPlant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de plantas disponíveis
    final plants = [
      Plant(name: 'Cenoura', timeToGrow: 30),
      Plant(name: 'Tomate', timeToGrow: 45),
    ];

    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: plants.map((plant) {
            return ElevatedButton(
              onPressed: () => onSelectPlant(plant),
              child: Text(plant.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
