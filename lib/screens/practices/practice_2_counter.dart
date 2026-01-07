import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../widgets/custom_drawer.dart';

class Practice2CounterScreen extends StatefulWidget {
  const Practice2CounterScreen({super.key});

  @override
  State<Practice2CounterScreen> createState() => _Practice2CounterScreenState();
}

class _Practice2CounterScreenState extends State<Practice2CounterScreen> {
  final List<String> _items = [];

  void _addItem() {
    if (_items.length >= 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Límite de 10 elementos alcanzado'),
        ),
      );
      return;
    }
    setState(() {
      _items.add('Hola Mundo ${_items.length + 1}');
    });
  }

  void _reset() {
    setState(() {
      _items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 2 - Contador / Lista'),
      ),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _addItem,
                  icon: const Icon(Icons.bolt),
                  label: const Text('Disparar'),
                ),
                OutlinedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ),
          Text(
            'Total: ${_items.length} / 10',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Expanded(
            child: _items.isEmpty
                ? const Center(
                    child: Text('No hay elementos aún. Pulsa "Disparar".'),
                  )
                : ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo.shade100,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.indigo),
                          ),
                        ),
                        title: Text(_items[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}


