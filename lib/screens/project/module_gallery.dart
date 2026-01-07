import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../widgets/custom_drawer.dart';

class ModuleGalleryScreen extends StatelessWidget {
  const ModuleGalleryScreen({super.key});

  List<String> get _images =>
      List.generate(2, (index) => 'assets/images/img${index + 1}.png');

  void _showImageDialog(BuildContext context, String path) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(path, style: const TextStyle(fontSize: 12)),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(path, fit: BoxFit.cover),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = _images;

    return Scaffold(
      appBar: AppBar(title: const Text('Módulo 3 - Galería')),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: images
              .map(
                (path) => InkWell(
                  onTap: () => _showImageDialog(context, path),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(path, fit: BoxFit.cover),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
