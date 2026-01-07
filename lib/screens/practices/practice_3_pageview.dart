import 'dart:ui';
import 'package:flutter/material.dart';

import 'practice_1_hello.dart';
import 'practice_2_counter.dart';
import 'practice_4_form.dart';
import 'practice_5_rps_game.dart';

class Practice3PageView extends StatefulWidget {
  final int maxVisiblePractice;
  final int initialPage;

  const Practice3PageView({
    super.key,
    required this.maxVisiblePractice,
    this.initialPage = 0,
  });

  @override
  State<Practice3PageView> createState() => _Practice3PageViewState();
}

class _Practice3PageViewState extends State<Practice3PageView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildPages() {
    final pages = <Widget>[
      const Practice1HelloScreen(),
      const Practice2CounterScreen(),
    ];

    if (widget.maxVisiblePractice >= 4) {
      pages.add(const Practice4FormScreen());
    }

    if (widget.maxVisiblePractice >= 5) {
      pages.add(const Practice5RpsGameScreen());
    }

    return pages;
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();

    return Scaffold(
      // Usamos un Scaffold contenedor.
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: pages,
            ),
          ),

          // Botones de navegación flotantes personalizados para Desktop
          Positioned(
            left: 16,
            bottom: 16,
            child: _currentPage > 0
                ? FloatingActionButton(
                    heroTag: 'btn_prev',
                    onPressed: _previousPage,
                    child: const Icon(Icons.arrow_back),
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: _currentPage < pages.length - 1
                ? FloatingActionButton(
                    heroTag: 'btn_next',
                    onPressed: _nextPage,
                    child: const Icon(Icons.arrow_forward),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
