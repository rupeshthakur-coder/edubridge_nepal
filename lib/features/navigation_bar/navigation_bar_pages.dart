import 'package:flutter/material.dart';
import 'package:myapp/features/classes/classes_page.dart';
import 'package:myapp/features/homepage/home_page.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Progress Page'));
  }
}

// Colors and styles
const Color black = Color(0xFF191555);
const Color white = Color(0xFFFFFFFF);
const Color selectColor = Colors.black;
const TextStyle bntText = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

// Main NavigationBarPages class
class NavigationBarPages<NavigationBarPagesState> extends StatefulWidget {
  const NavigationBarPages({super.key});

  @override
  createState() => _NavigationBarPagesState();
}

class _NavigationBarPagesState extends State<NavigationBarPages> {
  int selectBtn = 0;

  // List of pages for navigation
  final List<Widget> pages = [
    const HomePage(),
    const ClassListPage(),
    const ProgressPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectBtn],
      bottomNavigationBar: navigationBar(), // Navigation bar at the bottom
    );
  }

  // Custom navigation bar
  AnimatedContainer navigationBar() {
    return AnimatedContainer(
      height: 90.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < navBtn.length; i++)
            GestureDetector(
              onTap: () => setState(() {
                selectBtn = i;
              }),
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }

  // Custom icon button
  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i;

    return SizedBox(
      width: 75.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            transform: Matrix4.translationValues(0, isActive ? -10.0 : 0.0, 0),
            child: Icon(
              navBtn[i].iconData,
              size: 30.0,
              color: isActive ? selectColor : black.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 4.0),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            transform: Matrix4.translationValues(0, isActive ? -6.0 : 0.0, 0),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isActive ? 1.0 : 0.7,
              child: Text(
                navBtn[i].name,
                style: bntText.copyWith(
                  color: isActive ? selectColor : black.withOpacity(0.7),
                  fontSize: isActive ? 14.0 : 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Model for holding icon and label data
class Model {
  final int id;
  final IconData iconData;
  final String name;

  Model({
    required this.id,
    required this.iconData,
    required this.name,
  });
}

// List of bottom navigation items with IconData
List<Model> navBtn = [
  Model(id: 0, iconData: Icons.home, name: 'Home'),
  Model(id: 1, iconData: Icons.book, name: 'Classes'),
  Model(id: 2, iconData: Icons.bar_chart, name: 'Progress'),
];
