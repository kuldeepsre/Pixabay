import 'package:flutter/material.dart';
import 'package:fluxestore/data/products_data.dart';
import '../../models/product_data_model.dart';

class RecomendedProductsListTile extends StatelessWidget {
  final List<ProductDataModel> recomenedItemsData;
  const RecomendedProductsListTile(
      {super.key, required this.recomenedItemsData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendedList.length,
        itemBuilder: (context, index) {
          List<ProductDataModel> locatList = [];
          for (var i = 4; i < recomenedItemsData.length; i++) {
            locatList.add(recomenedItemsData[i]);
          }
          ProductDataModel productData = locatList[index];
          return InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed("productDetails", arguments: productData);
              },
              child: RecomendedTileWidget(list: productData));
        },
      ),
    );
  }
}

class RecomendedTileWidget extends StatelessWidget {
  const RecomendedTileWidget({
    super.key,
    required this.list,
  });

  final ProductDataModel list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          width: 213,
          decoration: BoxDecoration(
            color: const Color.fromARGB(26, 251, 251, 251),
            border: Border.all(width: 2.0, color: const Color(0xffF9F9F9)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // fit:BoxFit.fill,
                  child: Image(
                    height: 76,
                    image: NetworkImage(
                      list.imageUrl ?? "",
                    ),
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    list.productName ?? "",
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xff1D1F22)),
                  ),
                  Text(
                    "\$${list.price ?? ""}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff1D1F22)),
                  )
                ],
              )
            ],
          )),
    );
  }
}


