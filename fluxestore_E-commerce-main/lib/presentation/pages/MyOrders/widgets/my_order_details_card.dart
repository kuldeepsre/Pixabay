// ignore: file_names

import 'package:fluxestore/models/my_orders_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../enums/delivarystatus.enum.dart';

class MyOrderDetailsCard extends StatelessWidget {
  final MyOrdersDataModel data;
  const MyOrderDetailsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String unFormattedDate = data.date.toString();

    DateTime dateTime = DateTime.parse(unFormattedDate);

    String formattedDate = DateFormat("dd/MM/yyyy").format(dateTime);

    String delivaryStatus = data.deliveryStatus.toString();
    Color statusTextColor;
    Color statusBgColor;
    DeliveryStatus status;

    if (delivaryStatus == "PENDING") {
      statusTextColor = const Color(0xffFF8730);
      statusBgColor = const Color(0xffFFF7E1);
      status = DeliveryStatus.pending;
    } else if (delivaryStatus == "DELIVERED") {
      statusTextColor = const Color(0xff00AB56);
      statusBgColor = const Color(0xffEFFFF4);
      status = DeliveryStatus.delivered;
    } else if (delivaryStatus == "CANCELLED") {
      statusTextColor = const Color(0xffFF424E);
      statusBgColor = const Color(0xffFFF0F1);
      status = DeliveryStatus.cancelled;
    } else {
      statusTextColor = Colors.black;
      statusBgColor = Colors.white;
      status = DeliveryStatus.cancelled;
    }
    return Container(
      width: 336,
      height: 182,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Color(0xffe8e8e8), blurRadius: 10.0, offset: Offset(0, 1))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#${data.orderID ?? ''}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff777E90),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Tracking number:",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff777E90),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  data.trackingNumber ?? "",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff141416),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Quantity: ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff777E90),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      data.quantity.toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff141416),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Subtotal: ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff777E90),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "\$${data.subTotal!.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff141416),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: Text(
                        data.deliveryStatus ?? '',
                        style: TextStyle(
                            fontSize: 14,
                            //data.deliveryStatus == 'PENDING' ? Color(0xffCF6212)
                            color: statusTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("orderDetailsPage",
                            arguments: {
                              "myordersData": data,
                              "status": status
                            });
                      },
                      child: const Text("Details",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff141416),
                              fontWeight: FontWeight.w400)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
