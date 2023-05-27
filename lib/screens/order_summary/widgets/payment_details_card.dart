
import 'package:flutter/material.dart';

class PaymentDetailsCard extends StatelessWidget {
  const PaymentDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                   Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Payment',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.credit_card),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '••••',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '9643',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                    '11/25',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

