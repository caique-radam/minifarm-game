import 'package:farm_game/game/components/plant.dart';

class Player {
  String name;
  int level = 0;

  Player(this.name);

  void levelUp() {
    level++;
  }

  void addSeedToInventory(Plant seed) {}
}
