import 'package:flutter/material.dart';

class ButtosScreens extends StatelessWidget {
  static const String name = 'buttons_name';
  const ButtosScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const Placeholder(),
    );
  }
}