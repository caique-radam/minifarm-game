enum PlantStage { seed, ripe }

class Plant {
  final String name;
  final double timeToGrow;
  double growingProgress;
  bool isRipe;

  Plant(
      {required this.name,
      required this.timeToGrow,
      this.growingProgress = 0.0})
      : isRipe = false;

  void updateGrowingProgress(double seconds) {
    growingProgress += seconds;
    if (growingProgress >= timeToGrow) {
      growingProgress = timeToGrow;
      isRipe = true;
    }
  }

  void reset() {
    growingProgress = 0.0;
    isRipe = false;
  }
}
