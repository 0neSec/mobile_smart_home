// lib/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<HomeViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  _buildHeader(viewModel),
                  _buildEnergyUsage(viewModel),
                  Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(HomeViewModel viewModel) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile_image.png'),
        ),
        SizedBox(height: 10),
        Text(
          viewModel.userName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Selamat Datang Di rumah'),
      ],
    );
  }

  Widget _buildEnergyUsage(HomeViewModel viewModel) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pemakaian Energi'),
                Text('${viewModel.energyUsage.date.day} Okt ${viewModel.energyUsage.date.year}'),
              ],
            ),
            SizedBox(height: 20),
            _buildEnergyItem(Icons.electric_bolt, 'Hari ini', '${viewModel.energyUsage.todayUsage} Watt'),
            _buildEnergyItem(Icons.flash_on, 'Bulan ini', '${viewModel.energyUsage.monthUsage} Kwh'),
            _buildEnergyItem(Icons.battery_charging_full, 'Tegangan', '${viewModel.energyUsage.voltage} Volt'),
            _buildEnergyItem(Icons.power, 'Plug', '${viewModel.energyUsage.plugUsage} Watt'),
            _buildEnergyItem(Icons.lightbulb_outline, 'Lampu', '${viewModel.energyUsage.lightUsage} Watt'),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.cyan),
          SizedBox(width: 10),
          Expanded(child: Text(label)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }


}