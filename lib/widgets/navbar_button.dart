import 'package:flutter/material.dart';

class NavBarButton {
  final String label;
  final IconData icon;

  NavBarButton({required this.label, required this.icon});

  BottomNavigationBarItem getItem() {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.grey.shade700,),
      label: 'Pants',
    );
  }
}