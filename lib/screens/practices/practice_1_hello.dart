import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../widgets/custom_drawer.dart';

class Practice1HelloScreen extends StatelessWidget {
  const Practice1HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Práctica 1 - Hola Mundo')),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: const Center(
        child: Text(
          '¡Hola Mundo!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
