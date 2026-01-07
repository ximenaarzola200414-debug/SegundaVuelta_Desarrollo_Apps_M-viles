import 'package:flutter/material.dart';

import '../app_config.dart';
import '../widgets/custom_drawer.dart';

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppHub - Inicio'),
      ),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 600;
              final children = [
                _HubCard(
                  icon: Icons.school,
                  title: 'Ir a Prácticas',
                  description: 'Prácticas académicas P1 - P5',
                  onTap: () => Navigator.pushNamed(context, '/practices'),
                ),
                _HubCard(
                  icon: Icons.offline_bolt,
                  title: 'Ir a Proyecto',
                  description: 'Kit Offline con módulos útiles',
                  onTap: () => Navigator.pushNamed(context, '/project'),
                ),
                _HubCard(
                  icon: Icons.settings,
                  title: 'Ajustes',
                  description: 'Tema claro/oscuro y créditos',
                  onTap: () => Navigator.pushNamed(context, '/settings'),
                ),
              ];

              return isWide
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: children
                          .map((c) => SizedBox(
                                width: constraints.maxWidth / 3 - 32,
                                child: c,
                              ))
                          .toList(),
                    )
                  : ListView.separated(
                      itemCount: children.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) => children[index],
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _HubCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _HubCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.indigo),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


