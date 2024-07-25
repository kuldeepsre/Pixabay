import 'package:flutter/material.dart';

class BannerCards extends StatelessWidget {
  final double height;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final String liteText;
  final String mainText;
  final String imagePath;
  const BannerCards({
    super.key,
    required this.height,
    required this.liteText,
    required this.mainText,
    required this.imagePath,
    required this.top,
    required this.left,
    required this.right,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF8F8FA)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: top, bottom: bottom, right: right, left: left),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  liteText,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Color(0xFF777E90),
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 120,
                  height: 90,
                  child: Text(
                    mainText,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF353945),
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFEDEDEE),
                radius: 70,
              ),
              const CircleAvatar(
                backgroundColor: Color(0Xffe2e2e2),
                radius: 55,
              ),
              Image.asset(
                imagePath,
              )
            ],
          )
        ],
      ),
    );
  }
}
