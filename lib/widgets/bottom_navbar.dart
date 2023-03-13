import 'package:flutter/material.dart';

List<BottomNavigationBarItem> getNavbarItems() {
  return [
    BottomNavigationBarItem(
      icon: Icon(Icons.grid_view_sharp),
      label: 'Products',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.logout),
      label: 'Log Out',
    ),
  ];
}
