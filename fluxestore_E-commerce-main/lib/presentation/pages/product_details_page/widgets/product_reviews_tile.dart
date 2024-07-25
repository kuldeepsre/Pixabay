import 'package:flutter/material.dart';
import 'package:fluxestore/models/product_review_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ProductReviewsTile extends StatelessWidget {
  final ProductReviewModel data;
  const ProductReviewsTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String unformatedDate = data.date.toString();
    DateTime date = DateTime.parse(unformatedDate);
    String formatedDate = DateFormat("dd/MM/yyyy").format(date);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(data.profileImage ?? ''),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RatingBarIndicator(
                            rating: double.parse(data.stars.toString()),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Color(0xff508A7B),
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(formatedDate,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff777E90),
                    fontWeight: FontWeight.w400))
          ],
        ),
        Text(
          data.description ?? '',
           style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400
           ),
          )
      ],
    );
  }
}
