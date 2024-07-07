import 'package:flutter/foundation.dart';
import 'package:myapp/model/timer.dart';

class TimerViewModel extends ChangeNotifier {
  List<Device> devices = [
    Device(name: 'Lampu 1', location: 'Kamar Tidur 1'),
    Device(name: 'Lampu 2', location: 'Kamar Tidur 2'),
    Device(name: 'Lampu 3', location: 'Ruang Keluarga'),
    Device(name: 'Lampu 4', location: 'Kamar Mandi'),
    Device(name: 'Plug 1', location: 'Kamar Tidur 1'),
    Device(name: 'Plug 2', location: 'Kamar Tidur 2'),
    Device(name: 'Plug 3', location: 'Ruang Keluarga'),
    Device(name: 'Plug 4', location: 'Kamar Mandi'),
  ];

  void toggleDevice(int index) {
    devices[index].isOn = !devices[index].isOn;
    notifyListeners();
  }

  void setTimer(int index, DateTime time) {
    devices[index].timer = time;
    notifyListeners();
  }
}