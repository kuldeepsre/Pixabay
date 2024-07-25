import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../reuseables/credit_card.dart';

class PaymentSectionView extends StatefulWidget {
  final Function(bool?)? onChanged;
  final Function(String paymentMethod)? onProceedToCheckOut;
  final double subTotal;
  final bool agreedToTermsAndConditions;
  const PaymentSectionView(
      {super.key,
      required this.onChanged,
      required this.agreedToTermsAndConditions,
      required this.onProceedToCheckOut,
      required this.subTotal});

  @override
  State<PaymentSectionView> createState() => _PaymentSectionViewState();
}

class _PaymentSectionViewState extends State<PaymentSectionView> {
  double horizontal = 20;
  // double vertical = 20;

  List<String> cardBgUrls = [
    "assets/images/card_blue.png",
    "assets/images/card_red.png",
    "assets/images/card_gradient.png",
  ];

  List<List<String>> paymentModes = [
    ["Cash", "assets/images/dollar_note.svg", "22"],
    ["Credit Card", "assets/images/credit_card_rounded.svg", "22"],
    ["", "assets/images/dots.svg", "10"],
  ];

  List<String> paymentMethodImages = [
    "assets/images/dollar_note.svg",
    "assets/images/credit_card_rounded.svg",
    "assets/images/dots.svg"
  ];
  int currentPaymentMethodIndex = 1;
  final PageController pageController = PageController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return Expanded(
      child: ListView(controller: scrollController, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: horizontal, vertical: 10),
              child: const Text("STEP 2",
                  style: TextStyle(
                      color: Color(0xff1D1F22),
                      fontSize: 11,
                      fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: horizontal, vertical: 0),
              child: const Text("Payment",
                  style: TextStyle(
                      color: Color(0xff1D1F22),
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: horizontal, vertical: 0),
              child: SizedBox(
                  height: 66,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: paymentModes.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPaymentMethodIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(
                            right: 18,
                          ),
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: 66,
                          decoration: BoxDecoration(
                              color: currentPaymentMethodIndex == index
                                  ? const Color(0xff43484B)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xffe8e8e8),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 1))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                height: double.parse(paymentModes[index][2]),
                                width: 35,
                                paymentModes[index][1].toString(),
                                colorFilter: ColorFilter.mode(
                                    currentPaymentMethodIndex == index
                                        ? Colors.white
                                        : const Color(0xff6E768A),
                                    BlendMode.srcIn),
                              ),
                              Text(
                                paymentModes[index][0],
                                style: TextStyle(
                                    color: currentPaymentMethodIndex == index
                                        ? Colors.white
                                        : const Color(0xff6E768A),
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
            currentPaymentMethodIndex == 1
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontal, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Choose your card",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                // showBottomSheet(
                                //     context: context,
                                //     builder: (context) => Container(
                                //           color: Colors.amber,
                                //         ));
                              },
                              child: const Text(
                                "Add new+",
                                style: TextStyle(
                                    color: Color(0xffF20000), fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w * 90,
                        height: 191,
                        child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cardBgUrls.length,
                            itemBuilder: (context, index) {
                              var card = cardBgUrls[index];
                              return CrediCard(
                                cardUrl: card,
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 30,
                  ),
            currentPaymentMethodIndex == 2
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontal, vertical: 5),
                        child: const Text(
                          "or check out with",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontal, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0XFFEFF1F6)),
                                      borderRadius: BorderRadius.circular(4.2)),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/PayPal.svg",
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0XFFEFF1F6)),
                                      borderRadius: BorderRadius.circular(4.2)),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/visa-logo.svg",
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0XFFEFF1F6)),
                                      borderRadius: BorderRadius.circular(4.2)),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/Mastercard.svg",
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0XFFEFF1F6)),
                                      borderRadius: BorderRadius.circular(4.2)),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/Alipay.svg",
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff1F72CD),
                                      border: Border.all(
                                          color: const Color(0XFF5590D4)),
                                      borderRadius: BorderRadius.circular(4.2)),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/amex.svg",
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
                : const SizedBox(
                    height: 0,
                  ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 10.0,
                        offset: Offset(1, 0))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    //* Product Price
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Product price",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8A8A8F),
                            ),
                          ),
                          Text(
                            "\$${widget.subTotal.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffE8E8E8),
                    ),
                    //* Shipping Details
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8A8A8F),
                            ),
                          ),
                          Text(
                            "Freeship",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffE8E8E8),
                    ),
                    //* Sub Total
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sub Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "\$${widget.subTotal.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff508A7B),
                            value: widget.agreedToTermsAndConditions,
                            onChanged: widget.onChanged),
                        const Text("I agree to",
                            style: TextStyle(
                                color: Color(0xff575757),
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        const Text("Terms and conditions",
                            style: TextStyle(
                                color: Color(0xff575757),
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 48,
                      width: 315,
                      child: ElevatedButton(
                          onPressed: () => widget.onProceedToCheckOut!(
                              paymentModes[currentPaymentMethodIndex][0]),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF343434))),
                          child: const Text(
                            "Proceed to checkout",
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
          ],
        ),
      ]),
    );
  }
}
