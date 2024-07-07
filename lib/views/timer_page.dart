import 'package:flutter/material.dart';
import 'package:myapp/ViewModel/timer_view_model.dart';
import 'package:myapp/model/timer.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Selamat Datang Di rumah'),
          actions: [
            CircleAvatar(child: Text('Haqqi')),
          ],
        ),
        body: Consumer<TimerViewModel>(
          builder: (context, viewModel, child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // childAspectRatio: 1.5,
              ),
              itemCount: viewModel.devices.length,
              itemBuilder: (context, index) {
                final device = viewModel.devices[index];
                return DeviceCard(
                  device: device,
                  onToggle: () => viewModel.toggleDevice(index),
                  onSetTimer: (time) => viewModel.setTimer(index, time),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final Device device;
  final VoidCallback onToggle;
  final Function(DateTime) onSetTimer;

  DeviceCard({required this.device, required this.onToggle, required this.onSetTimer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(device.name),
          Text(device.location),
          Switch(value: device.isOn, onChanged: (_) => onToggle()),
          if (device.timer != null) Text(device.timer.toString()),
          ElevatedButton(
            onPressed: () async {
              final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              if (time != null) {
                onSetTimer(DateTime(2024, 1, 1, time.hour, time.minute));
              }
            },
            child: Text('Set Timer'),
          ),
        ],
      ),
    );
  }
}