import 'package:flutter/material.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';

class BillDetailsCard extends StatelessWidget {
  final MyOrdersDataModel data;
  const BillDetailsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Color(0xffe8e8e8), blurRadius: 10.0, offset: Offset(0, 1))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LimitedBox(
              child: ListView.builder(
                  itemCount: data.orderedItems!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var itemsData = data.orderedItems![index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemsData.productName ?? "",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff141416),
                              fontWeight: FontWeight.w100),
                        ),
                        Row(
                          children: [
                            Text(
                              "x${itemsData.quantity.toString()}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff141416),
                                  fontWeight: FontWeight.w100),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Text(
                              "\$${itemsData.price}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff141416),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sub Total",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff141416),
                      fontWeight: FontWeight.w100),
                ),
                Text(
                  data.subTotal.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff141416),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Shipping",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff141416),
                      fontWeight: FontWeight.w100),
                ),
                Text(
                  data.shippingCharges.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff141416),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Divider(color: Color(0xffF3F3F6)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff141416),
                        fontWeight: FontWeight.w100),
                  ),
                  Text(
                    "\$${data.total}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff141416),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
