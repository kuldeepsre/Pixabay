import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CancellationSuccessDialog extends StatelessWidget {
  final String orderId;
  const CancellationSuccessDialog({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Lottie.asset("assets/lottie/cancel-confirmed.json",
                  height: 100, repeat: false),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Order ID #$orderId is cancelled!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(
                width: 260,
                child: Text(
                  "The refund for this order will be processed within 3-5 business days.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8D8E98),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 36,
                width: 119,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/', (Route<dynamic> route) => false);
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF343434))),
                    child: const Text(
                      "Go Back",
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
