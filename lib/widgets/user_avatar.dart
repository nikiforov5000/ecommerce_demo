import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/screens/user_account_screen/user_account_screen.dart';
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
      child: avatar,
    );
  }

  void buildUserAvatar() {
    print('user_avatar.dart -> buildUserAvatar()');

    // buildFromEmail();
    // buildFromName();
    // buildFromPhoto();
    // return;
    buildEmptyAvatar();
    if (_localUser != null) {
      if (_localUser!.photoUrl != null && _localUser!.photoUrl != '') {
        buildFromPhoto();
      } else if (_localUser!.displayName != null &&
          _localUser!.displayName != '') {
        buildFromName();
      } else if (_localUser!.email != null) {
        buildFromEmail();
      }
    }
  }

  void buildFromPhoto() {
    print('user_avatar.dart -> buildFromPhoto()');
    try {
      print('user_avatar.dart -> buildFromPhoto() photoUrl:' +
          _localUser!.photoUrl!);
      avatar =
          CircleAvatar(backgroundImage: NetworkImage(_localUser!.photoUrl!));
    } catch (e) {
      avatar = Text(
        'User',
        style: TextStyle(color: kAppBarIconColor),
      );
    }
  }

  void buildFromName() {
    print('user_avatar.dart -> buildFromName()');
    List<String>? namearr = _localUser!.displayName?.split(' ');
    if (namearr != null) {
      String? initials = namearr.length > 1
          ? namearr.getRange(0, 2).map((e) => e = e[0]).join('')
          : namearr[0];
      avatar = Text(
        initials,
        style: TextStyle(color: kAppBarIconColor),
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
    avatar = Text(
      emailInitials,
      style: TextStyle(color: kAppBarIconColor),
    );
  }
}
