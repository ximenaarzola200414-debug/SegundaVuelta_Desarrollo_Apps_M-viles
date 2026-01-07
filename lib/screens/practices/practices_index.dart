import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../widgets/custom_drawer.dart';

class PracticesIndexScreen extends StatelessWidget {
  const PracticesIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prácticas')),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Prácticas Académicas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _PracticeButton(
              label: 'Práctica 1 - Hola Mundo',
              onTap: () => Navigator.pushNamed(context, '/practices/p1'),
            ),
            _PracticeButton(
              label: 'Práctica 2 - Contador / Lista',
              onTap: () => Navigator.pushNamed(context, '/practices/p2'),
            ),
            _PracticeButton(
              label: 'Práctica 3 - Navegación Integrada',
              onTap: () => Navigator.pushNamed(context, '/practices/p3'),
            ),
            _PracticeButton(
              label: 'Práctica 4 - Formulario',
              onTap: () => Navigator.pushNamed(context, '/practices/p4'),
            ),
            _PracticeButton(
              label: 'Práctica 5 - Juego Piedra, Papel o Tijera',
              onTap: () => Navigator.pushNamed(context, '/practices/p5'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PracticeButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PracticeButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        height: 56,
        child: ElevatedButton(onPressed: onTap, child: Text(label)),
      ),
    );
  }
}
