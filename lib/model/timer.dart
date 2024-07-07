class Device {
  final String name;
  final String location;
  bool isOn;
  DateTime? timer;

  Device({required this.name, required this.location, this.isOn = false, this.timer});
}