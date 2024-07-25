import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductFeedBackPage extends StatelessWidget {
  const ProductFeedBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double userRating = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rate Product",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                    color: const Color(0xff575757),
                    borderRadius: BorderRadius.circular(10)),
                // ignore: prefer_const_constructors
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset("assets/images/gift_box.svg"),
                      const Text(
                        "Submit your review to get 5 points",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.all(5),
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star_rate_rounded,
                        color: Color(0xff508A7B),
                        size: 32,
                      );
                    },
                    onRatingUpdate: (rating) {
                      // userRating = rating;
                    }),
              ),
              Container(
                width: double.infinity,
                height: 267,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 10.0,
                        offset: Offset(0, 1))
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    maxLength: 120,
                    maxLines: 8,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            "Would you like to write anything about this product? ",
                        hintStyle: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    InkWell(
                        child: SvgPicture.asset(
                            "assets/images/upload_image_dotted.svg")),
                    const SizedBox(
                      width: 24,
                    ),
                    InkWell(
                        child: SvgPicture.asset(
                            "assets/images/camera_dotted.svg")),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //submit review button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF343434))),
                    child: const Text(
                      "Submit Review",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
