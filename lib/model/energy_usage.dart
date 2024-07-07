
class EnergyUsage {
  final double todayUsage;
  final double monthUsage;
  final double voltage;
  final double plugUsage;
  final double lightUsage;
  final DateTime date;

  EnergyUsage({
    required this.todayUsage,
    required this.monthUsage,
    required this.voltage,
    required this.plugUsage,
    required this.lightUsage,
    required this.date,
  });
}

class EnergyPlug {
  final double todayUsage;
  final double monthUsage;
  final DateTime date;

  EnergyPlug({required this.todayUsage, required this.monthUsage, required this.date});
}