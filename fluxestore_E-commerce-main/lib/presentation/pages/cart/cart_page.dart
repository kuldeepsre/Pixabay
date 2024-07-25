import 'package:flutter/material.dart';
import 'package:fluxestore/constants/constants.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/presentation/pages/cart/widgets/cart_loading_page.dart';
import 'package:fluxestore/presentation/pages/cart/widgets/cart_product_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/Mappers/mappers.dart';
import 'bloc/cart_page_bloc.dart';

class CartPage extends StatefulWidget {
  final String email;
  const CartPage({super.key, required this.email});

  @override
  State<CartPage> createState() => _CartPageState();
}

final CartPageBloc cartPageBloc = CartPageBloc();

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    cartPageBloc.add(CartPageInitialEvent(currentUserId: email));
    super.initState();
  }

  checkBox(bool value) {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<CartPageBloc, CartPageState>(
      bloc: cartPageBloc,
      listenWhen: (previous, current) => current is CartPageActionState,
      buildWhen: (previous, current) => current is! CartPageActionState,
      listener: (BuildContext context, CartPageState state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartPageLoadingState:
            return const CartLoadingPage();
          case CartSuccessState:
            final successState = state as CartSuccessState;
            String total = successState.subTotal.toStringAsFixed(2);
            return successState.cartSuccessData.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          "assets/lottie/empty-cart-grey.json",
                          width: 300,
                          height: 300,
                          repeat: false,
                        ),
                        const Text("Your Cart Is Empty!"),
                      ],
                    ),
                  )
                : Scaffold(
                    bottomNavigationBar: Container(
                      width: screenWidth,
                      height: screenHeight * 0.30,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            //* Product Price
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "\$$total",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "\$$total",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: screenWidth * 0.14,
                              width: screenHeight * 3,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (successState.subTotal != 0) {
                                      MyOrdersDataModel results = Mappers()
                                          .myOrdersDataMapper(
                                              successState.cartSuccessData,
                                              successState.subTotal,
                                              widget.email);
                                      Navigator.of(context).pushReplacementNamed(
                                          'checkOut',
                                          arguments: results);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Color(0xFFFF8080),
                                              content: Text(
                                                "Select Atleast one item to CheckOut!",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )));
                                    }
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF343434))),
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
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: successState.cartSuccessData.length,
                              itemBuilder: (context, index) {
                                var itemsData =
                                    successState.cartSuccessData[index];
                                return CartProductTile(
                                  data: itemsData,
                                  onIncrease: () {
                                    setState(() {
                                      // Increment the quantity of the specific product
                                      itemsData.quantity =
                                          (itemsData.quantity ?? 0) + 1;
                                    });
                                    cartPageBloc.add(UpdateCartItemEvent(
                                        updateditem: itemsData,
                                        originalcartList:
                                            successState.cartSuccessData));
                                  },
                                  onDecrease: () {
                                    setState(() {
                                      // Decrease the quantity of the specific product (if greater than 1)
                                      if (itemsData.quantity! > 1) {
                                        itemsData.quantity =
                                            itemsData.quantity! - 1;
                                      }
                                    });
                                    cartPageBloc.add(UpdateCartItemEvent(
                                        updateditem: itemsData,
                                        originalcartList:
                                            successState.cartSuccessData));
                                  },
                                  delete: (context) {
                                    cartPageBloc.add(RemoveAnItemFromCartEvent(
                                        productId: itemsData.id ?? '',
                                        userId: email));
                                  },
                                  onCheckBoxChanged: (bool? value) {
                                    itemsData.selected = value;
                                    cartPageBloc.add(UpdateCartItemEvent(
                                        updateditem: itemsData,
                                        originalcartList:
                                            successState.cartSuccessData));
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
