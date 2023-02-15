import 'package:flutter/material.dart';

List<BottomNavigationBarItem> getNavbarItems(bool isLoggedIn) {
  print('isLoggedIn ' + isLoggedIn.toString());
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
      icon: Icon(isLoggedIn ? Icons.logout : Icons.login),
      label: isLoggedIn ? 'Log Out' : 'Log In',
    ),
  ];
}
