import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRatingProgressBar extends StatelessWidget {
  final String starNumber;
  final double value;
  final int percentage;
  const ProductRatingProgressBar(
      {super.key,
      required this.starNumber,
      required this.value,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(starNumber),
          ),
          Padding(
             padding: const EdgeInsets.only(right: 5.0),
            child: RatingBarIndicator(
              rating: 2.75,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Color(0xff508A7B),
              ),
              itemCount: 1,
              itemSize: 20.0,
              direction: Axis.vertical,
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value,
              minHeight: 4,
              backgroundColor: const Color(0xffEFF0F1),
              color: const Color(0xff508A7B),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("$percentage%",
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  )),
          )
        ],
      ),
    );
  }
}
