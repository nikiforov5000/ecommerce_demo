import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/order_success/order_success_screen.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmitButton extends StatelessWidget {
  final ShoppingCart _shoppingCart;
  const SubmitButton(this._shoppingCart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalUserProvider localUserProvider =
        Provider.of<LocalUserProvider>(context);
    final LocalUser? localUser = localUserProvider.localUser;

    return ElevatedButton(
      onPressed: () async {
        UserAccount? userAccount =
            await UserAccount.fetchAccount(uid: localUser!.uid);

        if (userAccount!.hasShippingDetails()) {
          _shoppingCart.emptyCart();
          Navigator.popUntil(context, ModalRoute.withName(Wrapper.id));
          Navigator.pushNamed(context, OrderSuccessScreen.id);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please fill in shipping address details.'),
            ),
          );
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text('Submit Order'),
      ),
    );
  }
}
