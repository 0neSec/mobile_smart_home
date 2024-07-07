// lib/viewmodels/home_view_model.dart
import 'package:flutter/foundation.dart';
import 'package:myapp/model/energy_usage.dart';

class HomeViewModel extends ChangeNotifier {
  EnergyUsage _energyUsage = EnergyUsage(
    todayUsage: 692,
    monthUsage: 347.64,
    voltage: 46.13,
    plugUsage: 552,
    lightUsage: 140,
    date: DateTime(2023, 10, 20),
  );

  String _userName = "Haqqi";

  EnergyUsage get energyUsage => _energyUsage;
  String get userName => _userName;

  void refreshData() {
    // Simulasi pembaruan data
    _energyUsage = EnergyUsage(
      todayUsage: 692,
      monthUsage: 347.64,
      voltage: 46.13,
      plugUsage: 552,
      lightUsage: 140,
      date: DateTime.now(),
    );
    notifyListeners();
  }
}