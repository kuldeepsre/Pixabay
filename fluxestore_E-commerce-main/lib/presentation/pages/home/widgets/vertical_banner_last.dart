import 'package:flutter/material.dart';

class VerticalCards extends StatelessWidget {
  final double screenWidth;
  const VerticalCards({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 194,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: ()=>  Navigator.of(context).pushNamed("productsPage"),
              child: Container(
                width: double.infinity,
                height: 194,
                decoration: BoxDecoration(
                    color: const Color(0xFFF8F8FA),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Align(
                            // widthFactor: 0.6,
              
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "assets/images/tshirt.png",
                            ))),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "T-Shirts",
                          style: TextStyle(fontSize: 13, color: Color(0xff737680)),
                        ),
                        SizedBox(
                            width: 61,
                            height: 67,
                            child: Text(
                              "The Office Life",
                              style:
                                  TextStyle(fontSize: 17, color: Color(0xff1D1F22)),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: InkWell(
              onTap: ()=>  Navigator.of(context).pushNamed("productsPage"),
              child: Container(
                width: double.infinity,
                height: 194,
                decoration: BoxDecoration(
                    color: const Color(0xFFF8F8FA),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Dresses",
                            style:
                                TextStyle(fontSize: 13, color: Color(0xff737680)),
                          ),
                          SizedBox(
                              width: 61,
                              height: 67,
                              child: Text(
                                "Elegant Design",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xff1D1F22)),
                              )),
                        ],
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Align(
                            // widthFactor: 0.6,
              
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "assets/images/elegant.png",
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
