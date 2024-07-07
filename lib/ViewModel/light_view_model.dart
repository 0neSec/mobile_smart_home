import 'package:flutter/foundation.dart';
import 'package:myapp/model/light.dart';

class LightControlViewModel extends ChangeNotifier {
  List<Light> lights = [
    Light(name: 'Lampu 1', location: 'Kamar Tidur 1'),
    Light(name: 'Lampu 2', location: 'Kamar Tidur 2'),
    Light(name: 'Lampu 3', location: 'Ruang Keluarga'),
    Light(name: 'Lampu 4', location: 'Kamar Mandi'),
    Light(name: 'Lampu 5', location: 'Teras Depan'),
    Light(name: 'Lampu 6', location: 'Dapur'),
  ];

  EnergyUsage energyUsage = EnergyUsage(
    watts: 140,
    kWh: 67.2,
    date: DateTime(2023, 10, 20),
  );

  void toggleLight(int index) {
    lights[index].isOn = !lights[index].isOn;
    notifyListeners();
  }
}