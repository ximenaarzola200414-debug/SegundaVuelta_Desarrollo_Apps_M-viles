import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../widgets/custom_drawer.dart';

class ModuleNotesScreen extends StatefulWidget {
  const ModuleNotesScreen({super.key});

  @override
  State<ModuleNotesScreen> createState() => _ModuleNotesScreenState();
}

class _ModuleNotesScreenState extends State<ModuleNotesScreen> {
  final List<String> _notes = [];

  Future<void> _addNote() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nueva nota'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Contenido',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isEmpty) {
                  return;
                }
                Navigator.pop(context, controller.text.trim());
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _notes.add(result);
      });
    }
  }

  void _clearAll() {
    if (_notes.isEmpty) return;
    setState(() {
      _notes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Módulo 1 - Notas'),
        actions: [
          IconButton(
            onPressed: _clearAll,
            icon: const Icon(Icons.delete_sweep),
            tooltip: 'Borrar todas las notas',
          ),
        ],
      ),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: _notes.isEmpty
          ? const Center(
              child: Text('No hay notas. Usa el botón + para agregar.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo.shade100,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.indigo),
                      ),
                    ),
                    title: Text(_notes[index]),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}


