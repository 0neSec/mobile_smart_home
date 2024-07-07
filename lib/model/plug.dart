// lib/models/plug.dart
class Plug {
  final String id;
  final String name;
  final String location;
  bool isOn;

  Plug({required this.id, required this.name, required this.location, this.isOn = false});
}
