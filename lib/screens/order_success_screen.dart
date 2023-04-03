import 'package:ecommerce_demo/widgets/logout_button.dart';
import 'package:ecommerce_demo/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
class OrderSuccessScreen extends StatelessWidget {
  static const String id = 'order_success_screen';
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Success'),
        actions: [
          UserAvatarWidget(),
          LogoutButton(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 50.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 29.0),
                  height: 100.0,
                  width: double.infinity,
                  color: Color(0xff95E7BB),
                  child: Center(child: Text('Thank for you order', style: TextStyle(fontSize: 20, ),)),
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff95E7BB),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
