import 'package:flutter/material.dart';

class BottomNavigatorBar extends StatelessWidget {
  final int index;
  final Function(int index) onTap;

  const BottomNavigatorBar({required this.index, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomNavigationBar(
          currentIndex: index,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Expenses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notes_rounded),
              label: '',
            ),
          ],
        ),
      ],
    );
  }
}

class BottomNestedNavigationBarItem extends BottomNavigationBarItem {
  const BottomNestedNavigationBarItem({
    required this.initialLocation,
    required Widget icon,
    String? label,
  }) : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}
