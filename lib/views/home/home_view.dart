import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controllers/home/home_controller.dart';
import '../../routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  final GetStorage getStorage = GetStorage();
  late String? token;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token = GetStorage().read('requiresAuthToken');

    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton("Get Account Information", () {
             controller.accountInfoPage();
            }),
            buildButton("Get Last Four Numbers Phone", () {
              // Implement action for GetLastFourNumbersPhone
            }),
            buildButton("Get Open Trades", () {
              // Implement action for GetOpenTrades
            }),
            buildButton("User Profit", () {
              // Implement action for User Profit
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          GetStorage().remove('login');
          GetStorage().remove('storedLoginStatus');
          GetStorage().remove('requiresAuthToken');
          Get.offAllNamed(Routes.LOGIN);// Replace with the route to your login screen
        },
        child: Icon(Icons.logout),
      ),
    );
  }

  Widget buildButton(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
        //  primary: Colors.blue, // Change the color as per your design
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
