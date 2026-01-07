import 'package:flutter/material.dart';

import '../app_config.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void _navigate(BuildContext context, String routeName) {
    final current = ModalRoute.of(context)?.settings.name;
    Navigator.of(context).pop(); // Cerrar drawer
    if (current == routeName) return;
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    if (!AppConfig.showDrawer) {
      return const SizedBox.shrink();
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade400, Colors.indigo.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'AppHub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () => _navigate(context, '/'),
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Prácticas'),
            onTap: () => _navigate(context, '/practices'),
          ),
          ListTile(
            leading: const Icon(Icons.offline_bolt),
            title: const Text('Proyecto (Kit Offline)'),
            onTap: () => _navigate(context, '/project'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ajustes'),
            onTap: () => _navigate(context, '/settings'),
          ),
        ],
      ),
    );
  }
}
