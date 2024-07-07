class Light {
  final String name;
  final String location;
  bool isOn;

  Light({required this.name, required this.location, this.isOn = false});
}

class EnergyUsage {
  final double watts;
  final double kWh;
  final DateTime date;

  EnergyUsage({required this.watts, required this.kWh, required this.date});
}