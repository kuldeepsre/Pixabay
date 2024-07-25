import 'package:flutter/material.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/presentation/pages/MyOrders/widgets/my_order_details_card.dart';
import 'package:lottie/lottie.dart';

class OrdersList extends StatelessWidget {
  final List<MyOrdersDataModel> items;
  const OrdersList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        items.isEmpty
            ? SizedBox(
                // width: screenWidth*0.100,
                // height: screenHeight*0.100,
                child: Lottie.asset(
                  "assets/lottie/empty_order.json",
                  width: screenWidth * 0.50,
                  height: screenHeight * 0.50,
                ),
              )
            : Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var data = items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyOrderDetailsCard(
                          data: data,
                        ),
                      );
                    },
                  ),
                ),
              )
      ],
    );
  }
}
