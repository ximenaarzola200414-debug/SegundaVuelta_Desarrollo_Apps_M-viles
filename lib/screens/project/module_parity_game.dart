import 'dart:math';

import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../widgets/custom_drawer.dart';

enum ParityChoice { even, odd }

class ModuleParityGameScreen extends StatefulWidget {
  const ModuleParityGameScreen({super.key});

  @override
  State<ModuleParityGameScreen> createState() => _ModuleParityGameScreenState();
}

class _ModuleParityGameScreenState extends State<ModuleParityGameScreen> {
  final _random = Random();
  ParityChoice _choice = ParityChoice.even;
  int _userNumber = 0;
  int? _cpuNumber;
  int? _sum;
  String _message = 'Elige PAR o IMPAR y un número entre 0 y 5.';
  int _userScore = 0;
  int _cpuScore = 0;

  void _play() {
    final cpu = _random.nextInt(6);
    final total = _userNumber + cpu;
    final isEven = total % 2 == 0;
    final userChoseEven = _choice == ParityChoice.even;
    final userWins = (isEven && userChoseEven) || (!isEven && !userChoseEven);

    setState(() {
      _cpuNumber = cpu;
      _sum = total;
      if (userWins) {
        _userScore++;
        _message = 'Ganaste: $total (${isEven ? 'PAR' : 'IMPAR'})';
      } else {
        _cpuScore++;
        _message = 'Perdiste: $total (${isEven ? 'PAR' : 'IMPAR'})';
      }
    });
  }

  void _reset() {
    setState(() {
      _cpuNumber = null;
      _sum = null;
      _userScore = 0;
      _cpuScore = 0;
      _message = 'Elige PAR o IMPAR y un número entre 0 y 5.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Módulo 4 - Juego Par o Impar'),
      ),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tu elección:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<ParityChoice>(
                    title: const Text('PAR'),
                    value: ParityChoice.even,
                    groupValue: _choice,
                    onChanged: (v) {
                      if (v != null) {
                        setState(() => _choice = v);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<ParityChoice>(
                    title: const Text('IMPAR'),
                    value: ParityChoice.odd,
                    groupValue: _choice,
                    onChanged: (v) {
                      if (v != null) {
                        setState(() => _choice = v);
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Tu número (0-5):'),
                const SizedBox(width: 12),
                DropdownButton<int>(
                  value: _userNumber,
                  items: List.generate(
                    6,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text('$index'),
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _userNumber = value);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _play,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Jugar'),
            ),
            const SizedBox(height: 24),
            if (_cpuNumber != null && _sum != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tu número: $_userNumber'),
                      Text('Número CPU: $_cpuNumber'),
                      Text('Suma: $_sum'),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              'Marcador',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Jugador'),
                    Text('$_userScore'),
                  ],
                ),
                Column(
                  children: [
                    const Text('CPU'),
                    Text('$_cpuScore'),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: OutlinedButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh),
                label: const Text('Reiniciar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


