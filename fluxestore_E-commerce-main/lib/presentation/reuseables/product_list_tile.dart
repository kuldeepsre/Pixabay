import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/product_data_model.dart';

class ProductCardTile extends StatelessWidget {
  final ProductDataModel product;
  const ProductCardTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            width: 126,
            height: 172,
            product.imageUrl.toString(),
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadinProgress) {
              if (loadinProgress == null) {
                return child;
              } else {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 126,
                        height: 172,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ));
              }
            },
          ),
        ),
        const SizedBox(height: 5),
        Text(
          product.productName.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        Text(
          "\$${product.price}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
