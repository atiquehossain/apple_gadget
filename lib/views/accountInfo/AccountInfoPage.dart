import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/accountInfo/AccountController.dart';

class AccountInfoPage extends GetView<AccountController> {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
      ),
      body: Center(
        child: Obx(
          () {
            if (controller.accountInfo.isEmpty) {
              return CircularProgressIndicator();
            } else {
              return ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  ListTile(
                    title: Text('Name: ${controller.accountInfo['name']}'),
                  ),
                  ListTile(
                    title:
                        Text('Address: ${controller.accountInfo['address']}'),
                  ),
                  ListTile(
                    title: Text('City: ${controller.accountInfo['city']}'),
                  ),
                  ListTile(
                    title:
                        Text('Country: ${controller.accountInfo['country']}'),
                  ),
                  ListTile(
                    title: Text('Phone: ${controller.accountInfo['phone']}'),
                  ),
                  ListTile(
                    title:
                        Text('Balance: ${controller.accountInfo['balance']}'),
                  ),
                  ListTile(
                    title: Text('Equity: ${controller.accountInfo['equity']}'),
                  ),
                  ListTile(
                    title: Text(
                        'Free Margin: ${controller.accountInfo['freeMargin']}'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
