import 'package:flutter/material.dart';

import 'navbar_button.dart';


class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        NavBarButton(icon: Icons.business_center, label: 'business').getItem(),
        NavBarButton(icon: Icons.attach_money, label: 'business').getItem(),
        NavBarButton(icon: Icons.medical_information, label: 'business').getItem(),
        NavBarButton(icon: Icons.add_a_photo, label: 'business').getItem(),
      ],


    );
  }
}
