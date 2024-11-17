import 'package:farm_game/game/components/plant.dart';
import 'package:flutter/material.dart';

class Inventory extends StatelessWidget {
  final void Function(Plant) onSelectPlant;

  const Inventory({required this.onSelectPlant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Plant>(
      icon: Icon(Icons.add_circle, size: 50, color: Colors.green),
      onSelected: onSelectPlant,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: Plant(name: "Cenoura", timeToGrow: 30),
          child: Text("Cenoura"),
        ),
        PopupMenuItem(
          value: Plant(name: "Milho", timeToGrow: 60),
          child: Text("Milho"),
        ),
        PopupMenuItem(
          value: Plant(name: "Tomate", timeToGrow: 45),
          child: Text("Tomate"),
        ),
      ],
    );
  }
}
