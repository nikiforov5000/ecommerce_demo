import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAvatarWidget extends StatelessWidget {
  UserAvatarWidget({required this.user});

  User? user;
  Widget? avatar;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    buildUserAvatar();
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 21,
            child: InkWell(
              onTap: () { authService.signOut(); },
              child: avatar!,
            ),
          )
      ),
    );
  }

  void buildUserAvatar() {
    buildEmptyAvatar();
    if (user != null) {
      if (user!.photoURL != null) {
        buildFromPhoto();
      }
      else if (user!.displayName != null) {
        buildFromName();
      }
      else if (user!.email != null) {
        buildFromEmail();
      }
    }
  }

  void buildFromPhoto() {
    avatar =  CircleAvatar(
      backgroundImage: NetworkImage(user!.photoURL!),
      radius: 18,
    );
  }

  void buildFromName() {
    String? initials = user!.displayName
        ?.split(' ')
        .getRange(0, 2)
        .map((e) => e = e[0])
        .join('');
    avatar = CircleAvatar(
      radius: 18,
      child: Text(initials!),
    );
  }

  void buildEmptyAvatar() {
    avatar = Icon(
      Icons.account_circle,
      size: 40,
    );
  }

  void buildFromEmail() {
    String emailInitials = user!.email.toString().substring(0, 2).toUpperCase();
    avatar = Text(emailInitials);
  }
}