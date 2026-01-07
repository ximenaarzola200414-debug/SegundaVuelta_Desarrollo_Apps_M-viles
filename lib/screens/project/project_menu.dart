import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../widgets/custom_drawer.dart';

class ProjectMenuScreen extends StatelessWidget {
  const ProjectMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyecto - Kit Offline'),
      ),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Módulos del Kit Offline',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _ModuleButton(
              icon: Icons.note,
              title: 'Módulo 1 - Notas',
              subtitle: 'Lista simple de notas en memoria',
              onTap: () => Navigator.pushNamed(context, '/project/notes'),
            ),
            _ModuleButton(
              icon: Icons.monitor_weight,
              title: 'Módulo 2 - IMC',
              subtitle: 'Calculadora de Índice de Masa Corporal',
              onTap: () => Navigator.pushNamed(context, '/project/bmi'),
            ),
            _ModuleButton(
              icon: Icons.photo_album,
              title: 'Módulo 3 - Galería',
              subtitle: 'Grid de imágenes desde assets',
              onTap: () => Navigator.pushNamed(context, '/project/gallery'),
            ),
            _ModuleButton(
              icon: Icons.gamepad,
              title: 'Módulo 4 - Juego Par o Impar',
              subtitle: 'Juego simple contra la CPU',
              onTap: () => Navigator.pushNamed(context, '/project/parity'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuleButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ModuleButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        child: ListTile(
          leading: Icon(icon, color: Colors.indigo),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ),
    );
  }
}


