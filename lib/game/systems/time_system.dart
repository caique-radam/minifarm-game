import 'package:flame/components.dart';

class TimeSystem extends Component {
  // Time variables
  int year = 1;
  int month = 1;
  int day = 1;
  int hour = 0;

  // Time Configuration
  static const int hoursPerDay = 24;
  static const int daysPerMonth = 30;
  static const int monthsPerYear = 12;

  // Time accumulator to handle progression
  double _timeAccumulator = 0;
  final double timeStep; // Seconds per in-game hour

  // Event Callbacks
  Function()? onDayPassed;
  Function()? onMonthPassed;
  Function()? onYearPassed;
  Function()? onSeasonChanged;

  TimeSystem({this.timeStep = 1.0});

  @override
  void update(double dt) {
    super.update(dt);

    _timeAccumulator += dt;

    if (_timeAccumulator >= timeStep) {
      _timeAccumulator -= timeStep;
      _tick();
    }
  }

  void _tick() {
    hour++;
    if (hour >= hoursPerDay) {
      hour = 0;
      day++;
      onDayPassed?.call();
    }
    if (day > daysPerMonth) {
      day = 0;
      month++;
      onMonthPassed?.call();
      _triggerSeasonChange();
    }
    if (month > monthsPerYear) {
      month = 0;
      year++;
      onYearPassed?.call();
    }
  }

  void _triggerSeasonChange() {
    if (month == 1 || month == 2 || month == 3 || month == 4) {
      onSeasonChanged?.call();
    }
  }

  /// Returns the current season
  String get currentSeason {
    switch (month) {
      case 1:
        return "Spring";
      case 2:
        return "Summer";
      case 3:
        return "Fall";
      case 4:
        return "Winter";
      default:
        return "Unknown";
    }
  }
}
