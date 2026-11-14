import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WeatherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Malang',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Text(
              '25°',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                WeatherItem(day: 'Minggu', icon: Icons.sunny, temp: '28°C'),
                WeatherItem(day: 'Senin', icon: Icons.cloudy_snowing, temp: '23°C'),
                WeatherItem(day: 'Selasa', icon: Icons.cloud, temp: '22°C'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherItem extends StatelessWidget {
  final String day;
  final IconData icon;
  final String temp;

  const WeatherItem({
    super.key,
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 4),
        Text(temp, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
