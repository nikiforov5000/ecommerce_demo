import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/user_shipping_details.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingAddressDetailsCard extends StatelessWidget {
  ShippingAddressDetailsCard({Key? key,}) : super(key: key);
  UserAccount? _userAccount;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalUserProvider>(context);
    final localUser = provider.localUser;
    // _userAccount = UserAccount.fetchAccount(uid: localUser!.uid);
    return FutureBuilder(
        future: UserAccount.fetchAccount(uid: localUser!.uid),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            _userAccount = snapshot.data as UserAccount?;
            return UserShippingDetails(_userAccount!);
          }
        });
  }
}
