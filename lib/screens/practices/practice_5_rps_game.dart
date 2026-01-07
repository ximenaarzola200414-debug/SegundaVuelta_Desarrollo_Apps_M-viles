import 'dart:math';

import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../widgets/custom_drawer.dart';

enum RpsMove { rock, paper, scissors }

class Practice5RpsGameScreen extends StatefulWidget {
  const Practice5RpsGameScreen({super.key});

  @override
  State<Practice5RpsGameScreen> createState() => _Practice5RpsGameScreenState();
}

class _Practice5RpsGameScreenState extends State<Practice5RpsGameScreen> {
  final _random = Random();
  RpsMove? _playerChoice;
  RpsMove? _cpuChoice;
  String _result = 'Elige tu jugada para comenzar';
  int _playerScore = 0;
  int _cpuScore = 0;
  int _ties = 0;

  void _play(RpsMove move) {
    final cpuMove = RpsMove.values[_random.nextInt(3)];

    setState(() {
      _playerChoice = move;
      _cpuChoice = cpuMove;

      if (move == cpuMove) {
        _result = 'Empate';
        _ties++;
      } else if (_isPlayerWinner(move, cpuMove)) {
        _result = '¡Ganaste!';
        _playerScore++;
      } else {
        _result = 'Perdiste';
        _cpuScore++;
      }
    });
  }

  bool _isPlayerWinner(RpsMove player, RpsMove cpu) {
    return (player == RpsMove.rock && cpu == RpsMove.scissors) ||
        (player == RpsMove.paper && cpu == RpsMove.rock) ||
        (player == RpsMove.scissors && cpu == RpsMove.paper);
  }

  void _reset() {
    setState(() {
      _playerChoice = null;
      _cpuChoice = null;
      _result = 'Elige tu jugada para comenzar';
      _playerScore = 0;
      _cpuScore = 0;
      _ties = 0;
    });
  }

  String _moveLabel(RpsMove? move) {
    if (move == null) return '-';
    switch (move) {
      case RpsMove.rock:
        return 'Piedra';
      case RpsMove.paper:
        return 'Papel';
      case RpsMove.scissors:
        return 'Tijera';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 5 - Piedra, Papel o Tijera'),
      ),
      drawer: AppConfig.showDrawer ? const CustomDrawer() : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Jugador',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_moveLabel(_playerChoice)),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'CPU',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_moveLabel(_cpuChoice)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Elige tu jugada:',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _play(RpsMove.rock),
                  icon: const Icon(Icons.circle),
                  label: const Text('Piedra'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _play(RpsMove.paper),
                  icon: const Icon(Icons.description),
                  label: const Text('Papel'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _play(RpsMove.scissors),
                  icon: const Icon(Icons.content_cut),
                  label: const Text('Tijera'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),
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
                    Text('$_playerScore'),
                  ],
                ),
                Column(
                  children: [
                    const Text('CPU'),
                    Text('$_cpuScore'),
                  ],
                ),
                Column(
                  children: [
                    const Text('Empates'),
                    Text('$_ties'),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: OutlinedButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh),
                label: const Text('Reiniciar marcador'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


