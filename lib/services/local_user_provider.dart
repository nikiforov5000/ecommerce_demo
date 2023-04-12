import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:flutter/foundation.dart';

class LocalUserProvider extends ChangeNotifier {
  LocalUser? _localUser;

  LocalUser? get localUser => _localUser;

  set localUser(LocalUser? user) {
    _localUser = user;
    // notifyListeners();
  }

}