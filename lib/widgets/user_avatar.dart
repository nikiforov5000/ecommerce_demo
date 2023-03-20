import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_demo/services/auth_service.dart';

class UserAvatarWidget extends StatelessWidget {

  Widget? avatar;

  late final AuthService authService;
  late final auth.User? authUser;

  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);
    authUser = authService.authUser;

    buildUserAvatar();
    return GestureDetector(
      onTap: (){ authService.signOut(); },
      child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              radius: 21,
              child: avatar!,
            ),
          )),
    );
  }

  void buildUserAvatar() {
    buildEmptyAvatar();
    if (authUser != null) {
      if (authUser!.photoURL != null) {
        buildFromPhoto();
      } else if (authUser!.displayName != null) {
        buildFromName();
      } else if (authUser!.email != null) {
        buildFromEmail();
      }
    }
  }

  void buildFromPhoto() {
    avatar = CircleAvatar(
      backgroundImage: NetworkImage(authUser!.photoURL!),
      radius: 18,
    );
  }

  void buildFromName() {
    List<String>? namearr = authUser!.displayName?.split(' ');
    if (namearr != null) {
      String? initials = namearr.length > 1 ?
          namearr.getRange(0, 2)
          .map((e) => e = e[0])
          .join('')
      : namearr[0];
      avatar = CircleAvatar(
        radius: 18,
        child: Text(initials),
      );
    }
  }

  void buildEmptyAvatar() {
    avatar = Icon(
      Icons.account_circle,
      size: 40,
    );
  }

  void buildFromEmail() {
    String emailInitials = authUser!.email.toString().substring(0, 2).toUpperCase();
    avatar = Text(emailInitials);
  }
}



// InkWell(
// child: Consumer<UserProvider>(
// builder: (context, userProvider, _) {
// return Text(
// userProvider.user!.email,
// style: TextStyle(
// color: Colors.black,
// ),
// );
// },
// ),
// onTap: () {
// userProvider.setUserToNull();
// authService.signOut();
// },
