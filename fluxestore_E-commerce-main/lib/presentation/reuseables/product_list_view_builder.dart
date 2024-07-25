import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/reuseables/product_list_tile.dart';

import '../../models/product_data_model.dart';

class ProductListViewBuilder extends StatelessWidget {
  final dynamic items;
  final int? requiredItemCount;
  const ProductListViewBuilder(
      {super.key, required this.items, required this.requiredItemCount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: requiredItemCount,
        itemBuilder: (context, index) {
          ProductDataModel producData = items[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 0),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed("productDetails", arguments: producData);
              },
              child: ProductCardTile(product: producData),
            ),
          );
        },
      ),
    );
  }
}
