import 'package:flutter/material.dart';

import 'app_config.dart';
import 'screens/hub_screen.dart';
import 'screens/practices/practices_index.dart';
import 'screens/practices/practice_1_hello.dart';
import 'screens/practices/practice_2_counter.dart';
import 'screens/practices/practice_3_pageview.dart';
import 'screens/project/project_menu.dart';
import 'screens/project/module_notes.dart';
import 'screens/project/module_bmi.dart';
import 'screens/project/module_gallery.dart';
import 'screens/project/module_parity_game.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _updateThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
    );

    final darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );

    final routes = _buildRoutes();

    return MaterialApp(
      title: 'AppHub',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      initialRoute: AppConfig.initialRoute,
      routes: routes,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) =>
            routes[AppConfig.initialRoute]?.call(context) ?? const HubScreen(),
      ),
    );
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    // Modo completo: todas las rutas.
    if (AppConfig.isFullApp) {
      return {
        '/': (context) => const HubScreen(),
        '/practices': (context) => const PracticesIndexScreen(),
        '/practices/p1': (context) => const Practice1HelloScreen(),
        '/practices/p2': (context) => const Practice2CounterScreen(),
        '/practices/p3': (context) =>
            const Practice3PageView(maxVisiblePractice: 3),
        '/practices/p4': (context) =>
            const Practice3PageView(maxVisiblePractice: 4, initialPage: 2),
        '/practices/p5': (context) =>
            const Practice3PageView(maxVisiblePractice: 5, initialPage: 3),
        '/project': (context) => const ProjectMenuScreen(),
        '/project/notes': (context) => const ModuleNotesScreen(),
        '/project/bmi': (context) => const ModuleBmiScreen(),
        '/project/gallery': (context) => const ModuleGalleryScreen(),
        '/project/parity': (context) => const ModuleParityGameScreen(),
        '/settings': (context) => SettingsScreen(
          themeMode: _themeMode,
          onThemeModeChanged: _updateThemeMode,
        ),
      };
    }

    // Modo práctico individual.
    final selected = AppConfig.initialRoute;

    // Caso especial: Proyecto requiere sub-rutas para sus módulos.
    if (selected == '/project' || selected == '/') {
      return {
        selected: (context) => const ProjectMenuScreen(),
        // Si la ruta inicial no es explícitamente /project, la agregamos por si acaso.
        if (selected != '/project')
          '/project': (context) => const ProjectMenuScreen(),
        '/project/notes': (context) => const ModuleNotesScreen(),
        '/project/bmi': (context) => const ModuleBmiScreen(),
        '/project/gallery': (context) => const ModuleGalleryScreen(),
        '/project/parity': (context) => const ModuleParityGameScreen(),
      };
    }

    WidgetBuilder builder;
    switch (selected) {
      case '/practices/p1':
        builder = (context) => const Practice1HelloScreen();
        break;
      case '/practices/p2':
        builder = (context) => const Practice2CounterScreen();
        break;
      case '/practices/p3':
        // Práctica 3: solo P1 y P2 visibles.
        builder = (context) => const Practice3PageView(maxVisiblePractice: 3);
        break;
      case '/practices/p4':
        // Práctica 4: incluye P4, inicia en índice 2 (tercera página).
        builder = (context) =>
            const Practice3PageView(maxVisiblePractice: 4, initialPage: 2);
        break;
      case '/practices/p5':
        // Práctica 5: incluye P5, inicia en índice 3 (cuarta página).
        builder = (context) =>
            const Practice3PageView(maxVisiblePractice: 5, initialPage: 3);
        break;
      default:
        builder = (context) => const ProjectMenuScreen();
        break;
    }

    return {selected: builder};
  }
}
