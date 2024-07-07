import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/plug_view_model.dart';

class PlugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LigthViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<LigthViewModel>(
            builder: (context, viewModel, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(viewModel),
                    _buildEnergyUsage(viewModel),
                    _buildPlugWidgets(viewModel),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(LigthViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_image.png'),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selamat Datang Di rumah'),
                Text(viewModel.userName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Icon(Icons.qr_code_scanner, color: Colors.cyan),
        ],
      ),
    );
  }

  Widget _buildEnergyUsage(LigthViewModel viewModel) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pemakaian Energi'),
                Text('${viewModel.energyUsage.date.day} Okt ${viewModel.energyUsage.date.year}'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEnergyItem('Hari ini', Icons.electrical_services, '${viewModel.energyUsage.todayUsage} Watt'),
                _buildEnergyItem('Bulan ini', Icons.flash_on, '${viewModel.energyUsage.monthUsage} Kwh'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyItem(String label, IconData icon, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(icon, color: Colors.cyan, size: 18),
            SizedBox(width: 4),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildPlugWidgets(LigthViewModel viewModel) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: viewModel.plugs.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) => _buildPlugWidget(viewModel, viewModel.plugs[index]),
    );
  }

  Widget _buildPlugWidget(LigthViewModel viewModel, plug) {
    return Card(
      color: plug.isOn ? Colors.cyan : const Color.fromARGB(255, 255, 39, 39),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.power, color: Colors.white),
                Switch(
                  value: plug.isOn,
                  onChanged: (value) => viewModel.togglePlug(plug.id),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plug.name, style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold)),
                Text(plug.location, style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}