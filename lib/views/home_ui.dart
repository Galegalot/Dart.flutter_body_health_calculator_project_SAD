import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmr_ui.dart';
import 'package:flutter_body_health_calculator_project/views/about_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _currentIndex = 1;

  final List<Widget> _pages = const [
    BmiUI(),
    AboutUI(),
    BmrUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFD32F2F),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'BMR',
          ),
        ],
      ),
    );
  }
}
