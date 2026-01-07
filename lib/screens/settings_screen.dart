import 'package:flutter/material.dart';

import '../app_config.dart';
import '../widgets/custom_drawer.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const SettingsScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Tema oscuro'),
            subtitle: const Text('Activa o desactiva el modo oscuro'),
            value: isDark,
            onChanged: (value) {
              onThemeModeChanged(value ? ThemeMode.dark : ThemeMode.light);
            },
            secondary: const Icon(Icons.dark_mode),
          ),
          const Divider(),
          const ListTile(
            title: Text('Créditos'),
            subtitle: Text(
              'AppHub - Integración de Prácticas Académicas y Kit Offline.\n'
              'Desarrollado por Jennifer Ximena Arzola Gonzalez.',
            ),
          ),
        ],
      ),
    );
  }
}


