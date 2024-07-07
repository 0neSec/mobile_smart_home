import 'package:flutter/foundation.dart';
import '../model/plug.dart';
import '../model/energy_usage.dart';

class LigthViewModel extends ChangeNotifier {
  List<Plug> _plugs = [
    Plug(id: '1', name: 'Plug 1', location: 'Kamar Tidur 1', isOn: true),
    Plug(id: '2', name: 'Plug 2', location: 'Kamar Tidur 2', isOn: true),
    Plug(id: '3', name: 'Plug 3', location: 'Ruang Keluarga', isOn: true),
    Plug(id: '4', name: 'Plug 4', location: 'Kamar Mandi', isOn: false),
    Plug(id: '5', name: 'Plug 5', location: 'Teras Depan', isOn: false),
    Plug(id: '6', name: 'Plug 6', location: 'Dapur', isOn: true),
  ];

  EnergyUsage _energyUsage = EnergyUsage(
    todayUsage: 552,
    monthUsage: 280.44,
    date: DateTime(2023, 10, 20),
    voltage: 46.13,
    lightUsage: 140,
    plugUsage: 552,
  );

  String _userName = "Haqqi";

  List<Plug> get plugs => _plugs;
  EnergyUsage get energyUsage => _energyUsage;
  String get userName => _userName;

  void togglePlug(String id) {
    final index = _plugs.indexWhere((plug) => plug.id == id);
    if (index != -1) {
      _plugs[index].isOn = !_plugs[index].isOn;
      notifyListeners();
    }
  }
}