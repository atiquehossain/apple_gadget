import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/GetOpenTrades/GetOpenTradesController.dart';

class GetOpenTradesView extends GetView<GetOpenTradesController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text("Get Open Trades & User Profit"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchgetOpenTradesInformation();
        },
        child: Obx(
              () {
            if (controller.getOpenTradesInfo.isEmpty) {
              return LinearProgressIndicator();
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.getOpenTradesInfo.length,
                      itemBuilder: (context, index) {
                        var trade = controller.getOpenTradesInfo[index];


                        return Card(
                          child: Column(
                            children: [
                              Text('Trade #${trade['ticket']}'),
                              Text('Symbol: ${trade['symbol']}'),
                              Text('Profit: ${trade['profit']}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Total Profit: '+controller.totalProfit.toString(),style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                    ),),
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
