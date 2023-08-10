import 'package:ecommerce_demo/screens/user_account_screen/widgets/edit_details_body.dart';
import 'package:ecommerce_demo/screens/user_account_screen/widgets/header_edit_details.dart';
import 'package:flutter/material.dart';

class EditEntryIcon extends StatelessWidget {
  const EditEntryIcon({Key? key}) : super(key: key);

  void _showEditModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderEditDetails(),
                EditDetailsBody(),
              ],
            ),
          ),
        );
      },
    );
  }
  /// TODO finish update
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showEditModal(context),
      child: const Icon(Icons.edit),
    );
  }
}
