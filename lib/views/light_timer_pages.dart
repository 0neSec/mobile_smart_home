import 'package:flutter/material.dart';
import 'package:myapp/ViewModel/light_view_model.dart';
import 'package:provider/provider.dart';

import '../model/light.dart';

class LightControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LightControlViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<LightControlViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  _buildHeader(viewModel),
                  _buildEnergyUsage(viewModel),
                  _buildLightGrid(viewModel),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(LightControlViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
            radius: 30,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Selamat Datang Di rumah'),
              Text('Haqqi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ],
          ),
          Spacer(),
          Icon(Icons.lightbulb_outline, size: 30, color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildEnergyUsage(LightControlViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pemakaian Energi'),
              Text('${viewModel.energyUsage.date.day} Okt, ${viewModel.energyUsage.date.year}'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.lightbulb, color: Colors.blue),
                  Text('${viewModel.energyUsage.watts} W', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Hari ini'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.flash_on, color: Colors.orange),
                  Text('${viewModel.energyUsage.kWh} kWh', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Bulan ini'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLightGrid(LightControlViewModel viewModel) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: viewModel.lights.length,
        itemBuilder: (context, index) {
          final light = viewModel.lights[index];
          return _buildLightCard(light, () => viewModel.toggleLight(index));
        },
      ),
    );
  }

  Widget _buildLightCard(Light light, VoidCallback onToggle) {
    return Container(
      decoration: BoxDecoration(
        color: light.isOn ? Colors.cyan : const Color.fromARGB(255, 255, 39, 39),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lightbulb_outline, color: Colors.white),
          SizedBox(height: 8),
          Text(light.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text(light.location, style: TextStyle(color: Colors.white)),
          Switch(
            value: light.isOn,
            onChanged: (_) => onToggle(),
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}