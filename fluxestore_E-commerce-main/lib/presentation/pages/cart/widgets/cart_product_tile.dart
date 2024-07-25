import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluxestore/models/cart_items_model.dart';

class CartProductTile extends StatelessWidget {
  final CartItemsModel data;
  final Function(BuildContext)? delete;
  final Function()? onIncrease;
  final Function(bool)? onCheckBoxChanged;
  final Function()? onDecrease;
  const CartProductTile({
    super.key,
    required this.delete,
    required this.data,
    required this.onIncrease,
    required this.onDecrease,
    required this.onCheckBoxChanged,
  });

  @override
  Widget build(BuildContext context) {
    // String color = data.color.toString();
    // var colorsSlplit = color.split('.');
    // var validColor = colorsSlplit[1].toString();

    // var color = data.color


    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const BehindMotion(), children: [
          SlidableAction(
            onPressed: delete,
            icon: (Icons.delete),
            backgroundColor: const Color(0xFFFF8080),
            foregroundColor: const Color(0xffC8C7CC),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.infinity,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 10.0,
                    offset: Offset(0, 1))
              ],
            ),
            //main row
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Image
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      child: Image.network(data.imageUrl ?? '',
                          width: 98, height: 120, fit: BoxFit.cover),
                    ),
                  ],
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name and check box
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.productName ?? '',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            Checkbox(
                              value: data.selected ?? false,
                              onChanged: (bool? value) {
                                onCheckBoxChanged!(value ?? false);
                              },

                              activeColor: const Color(0xff508A7B),
                              checkColor: Colors.white,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${data.price}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Size: ${data.size}  |  Color: ${data.color} ",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8A8A8F),
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: const Color(0xff808080)),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: onDecrease,
                                    // onTap: onDecrease != null
                                    //     ? (int value) {
                                    //         onDecrease!(value);
                                    //       }
                                    //     : null,
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff808080)),
                                    ),
                                  ),
                                  Text(
                                    data.quantity.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Color(0xff808080)),
                                  ),
                                  GestureDetector(
                                    onTap: onIncrease,
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff808080)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
