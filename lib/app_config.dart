import 'package:flutter/material.dart';

/// Configuración de modo de ejecución.
/// Usa --dart-define=APP_MODE=p1|p2|p4|p5|project|all
class AppConfig {
  static const String mode = String.fromEnvironment(
    'APP_MODE',
    defaultValue: 'all',
  );

  static bool get isFullApp => mode == 'all';

  static bool get showDrawer => isFullApp;

  static String get initialRoute {
    switch (mode) {
      case 'p1':
        return '/practices/p1';
      case 'p2':
        return '/practices/p2';
      case 'p3':
        return '/practices/p3';
      case 'p4':
        return '/practices/p4';
      case 'p5':
        return '/practices/p5';
      case 'project':
        return '/project';
      case 'all':
      default:
        return '/';
    }
  }

  /// Texto amigable para mostrar en UI si se desea.
  static String get modeLabel => switch (mode) {
    'p1' => 'Práctica 1',
    'p2' => 'Práctica 2',
    'p3' => 'Práctica 3',
    'p4' => 'Práctica 4',
    'p5' => 'Práctica 5',
    'project' => 'Proyecto',
    _ => 'Completo',
  };
}
