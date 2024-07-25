import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CanformationDialog extends StatelessWidget {
  final VoidCallback onCancel;
  const CanformationDialog({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Container(
        height: 240,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/Close.svg",
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Colors.grey.shade600,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/cancel-order.png",
              height: 45,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Cancel This Order?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: SizedBox(
                width: 260,
                child: Text(
                  "This order will be cancelled and refund will be initiated!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8D8E98),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 130,
                        height: 37,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff8D8E98)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Go Back",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: onCancel,
                    child: Container(
                      width: 130,
                      height: 37,
                      decoration: BoxDecoration(
                        color: const Color(0xffD1293D),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
