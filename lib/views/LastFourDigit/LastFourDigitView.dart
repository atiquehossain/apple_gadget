import 'package:apple_gadget/controllers/LastFourDigitController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controllers/home/home_controller.dart';
import '../../routes/app_pages.dart';

class LastFourDigitView extends GetView<LastFourDigitController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last four digit'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
              () {
            if (controller.lastFourDigit.isEmpty) {
              return LinearProgressIndicator();
            } else {
              return Center(
                child: Text(
                  'Last Four Digits: ${controller.lastFourDigit['lastFourDigit']}',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
