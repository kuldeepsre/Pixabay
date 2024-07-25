import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxestore/constants/constants.dart';
import 'package:fluxestore/enums/delivarystatus.enum.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/presentation/pages/OrderDetails/widgets/cancellation_success_dialog.dart';
import 'package:fluxestore/presentation/reuseables/bill_details.dart';
import 'package:fluxestore/utils/dialogs/loading_dialog.dart';

import 'widgets/conformation_dialog.dart';
import 'bloc/order_details_page_bloc.dart';

class OrderDetailsPage extends StatefulWidget {
  final MyOrdersDataModel data;
  final DeliveryStatus status;
  const OrderDetailsPage({super.key, required this.data, required this.status});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final OrderDetailsPageBloc orderDetailsPageBloc = OrderDetailsPageBloc();
  CloseDialog? _closeDialogHandler;
  @override
  void initState() {
    super.initState();
    orderDetailsPageBloc
        .add(OrderDetailsPageInitialEvent(status: widget.status));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDetailsPageBloc, OrderDetailsPageState>(
      bloc: orderDetailsPageBloc,
      listenWhen: (previous, current) => current is OrderDetailsPageActionState,
      buildWhen: (previous, current) => current is! OrderDetailsPageActionState,
      listener: (context, state) {
        if (state is ShowLoadingActionState) {
          final closeDialog = _closeDialogHandler;
          if (!state.isLoading && closeDialog != null) {
            closeDialog();
            _closeDialogHandler = null;
          } else if (state.isLoading && closeDialog == null) {
            _closeDialogHandler = showLoadingDialog(context: context);
          }
        }
        if (state is ShowConfirmationDialogActionState) {
          showDialog(
              context: context,
              builder: (context) => CanformationDialog(
                    onCancel: () => {
                      orderDetailsPageBloc.add(ConfirmCancellationEvent(
                          userId: state.userId, orderId: state.orderId)),
                      Navigator.of(context).pop()
                    },
                  ));
        }
        if (state is CancellationSuccessActionState) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => CancellationSuccessDialog(orderId: widget.data.orderID.toString())
                  );
          orderDetailsPageBloc.add(
              OrderDetailsPageInitialEvent(status: DeliveryStatus.cancelled));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case PendingOrdersDetailsState:
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Order ${widget.data.orderID}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 92,
                        decoration: BoxDecoration(
                            color: const Color(0xff575757),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      "Your order is on the way",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Text(
                                    "Click here to track your order",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SvgPicture.asset("assets/images/Frame.svg"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //*Order Details--------------------------------------------------->
                      Container(
                        width: double.infinity,
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(3, 1))
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Order number ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(98, 20, 33, 128),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.data.orderID ?? "",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff141416),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tracking number ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(98, 20, 33, 128),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.data.trackingNumber ?? "",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff141416),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delivary address ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(97, 96, 97, 109),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      "${widget.data.deliveryAddress!.street},${widget.data.deliveryAddress!.city},${widget.data.deliveryAddress!.city}",
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff141416),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //*Bill------------------------------------------------------------>
                      BillDetailsCard(data: widget.data),
                      const SizedBox(
                        height: 30,
                      ),

                      //*Continue to shopping page--------------------------------------->
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/', (Route<dynamic> route) => false);
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFF343434))),
                                child: const Text(
                                  "Continue shopping",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )),
                          ),
                          SizedBox(
                            height: 48,
                            width: 142,
                            child: OutlinedButton(
                                onPressed: () async {
                                  orderDetailsPageBloc.add(CancelOrderEvent(
                                      userId: email,
                                      orderId: widget.data.orderID.toString()));
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1.0, color: Color(0xFFC50000)),
                                ),
                                child: const Text(
                                  "Cancel Order",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFC50000)),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          case DeliveredOrdersDetailsState:
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Order ${widget.data.orderID}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 92,
                        decoration: BoxDecoration(
                            color: const Color(0xff575757),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      "Your order is delivered",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Text(
                                    "Rate product to get 5 points for collect.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SvgPicture.asset("assets/images/delivered.svg")
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //*Order Details--------------------------------------------------->
                      Container(
                        width: double.infinity,
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(3, 1))
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Order number ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(98, 20, 33, 128),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.data.orderID ?? "",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff141416),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tracking number ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(98, 20, 33, 128),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.data.trackingNumber ?? "",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff141416),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delivary address ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(97, 96, 97, 109),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      "${widget.data.deliveryAddress!.street},${widget.data.deliveryAddress!.city},${widget.data.deliveryAddress!.city}",
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff141416),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //*Bill------------------------------------------------------------>
                      BillDetailsCard(data: widget.data),
                      const SizedBox(
                        height: 30,
                      ),
                      //*Continue to shopping page--------------------------------------->
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 44,
                            width: 168,
                            child: OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/', (Route<dynamic> route) => false);
                                },
                                child: const Text("Return home",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff777E90),
                                        fontWeight: FontWeight.w700))),
                          ),
                          SizedBox(
                            height: 44,
                            width: 119,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('productFeedbackPage');
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFF343434))),
                                child: const Text(
                                  "Rate",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          case CancelledOrdersDetailsState:
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Order ${widget.data.orderID}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
              ),
              body: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.velocity.pixelsPerSecond.dx > 0) {
                    // Navigate back to initial route and remove all other routes from stack
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/',
                      (route) => false,
                    );
                  }
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 92,
                          decoration: BoxDecoration(
                              color: const Color(0xff575757),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text(
                                        "Your order has been canceled",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Text(
                                      "Rate your experience to get 5 points for collect.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                    "assets/images/cancelled-order.svg",
                                    colorFilter: const ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //*Order Details--------------------------------------------------->
                        Container(
                          width: double.infinity,
                          height: 114,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xffe8e8e8),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 1))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Order number ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(98, 20, 33, 128),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      widget.data.orderID ?? "",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff141416),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Tracking number ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(98, 20, 33, 128),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      widget.data.trackingNumber ?? "",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff141416),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Delivary address ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(98, 20, 33, 128),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Text(
                                        "${widget.data.deliveryAddress!.street},${widget.data.deliveryAddress!.city},${widget.data.deliveryAddress!.city}",
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff141416),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        //*Bill------------------------------------------------------------>
                        BillDetailsCard(data: widget.data),
                        const SizedBox(
                          height: 30,
                        ),
                        //*Continue to shopping page--------------------------------------->
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 44,
                              width: 168,
                              child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/',
                                            (Route<dynamic> route) => false);
                                  },
                                  child: const Text("Return home",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff777E90),
                                          fontWeight: FontWeight.w700))),
                            ),
                            SizedBox(
                              height: 44,
                              width: 119,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('productFeedbackPage');
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF343434))),
                                  child: const Text(
                                    "Rate",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );

          default:
            const SizedBox();
        }

        return const SizedBox();
      },
    );
  }
}
