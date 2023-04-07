import 'package:ecommerce_demo/models/local_user.dart';
import 'package:ecommerce_demo/screens/user_account_screen.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAvatarWidget extends StatelessWidget {
  Widget? avatar;
  LocalUser? _localUser;

  @override
  Widget build(BuildContext context) {
    _localUser = context.watch<LocalUserProvider>().localUser;
    buildUserAvatar();
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UserAccountScreen.id);
      },
      child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              radius: 21,
              // child: avatar!,
            ),
          )),
    );
  }

  void buildUserAvatar() {
    buildEmptyAvatar();
    if (_localUser != null) {
      if (_localUser!.photoUrl != null) {
        buildFromPhoto();
      } else if (_localUser!.displayName != null) {
        buildFromName();
      } else if (_localUser!.email != null) {
        buildFromEmail();
      }
    }
  }

  void buildFromPhoto() {
    avatar = CircleAvatar(
      backgroundImage: NetworkImage(_localUser!.photoUrl!),
      radius: 18,
    );
  }

  void buildFromName() {
    List<String>? namearr = _localUser!.displayName?.split(' ');
    if (namearr != null) {
      String? initials = namearr.length > 1
          ? namearr.getRange(0, 2).map((e) => e = e[0]).join('')
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
    String emailInitials =
        _localUser!.email.toString().substring(0, 2).toUpperCase();
    avatar = Text(emailInitials);
  }
}
