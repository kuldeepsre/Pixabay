import 'package:flutter/material.dart';
import 'package:fluxestore/utils/Mappers/mappers.dart';
import 'package:fluxestore/models/cart_items_model.dart';
import 'package:fluxestore/models/product_review_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluxestore/presentation/reuseables/product_list_view_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/utils/formatters/formatter.dart';
import 'package:toastification/toastification.dart';
import '../../../models/product_data_model.dart';
import '../../../repository/productsRepo/products_repository.dart';
import '../../../utils/icons_constants/primary_icons_icons.dart';
import '../../../utils/icons_constants/secondary_icons_icons.dart';
import 'widgets/expansion_panel.dart';
import 'widgets/product_rating_progress_bars.dart';
import 'widgets/product_reviews_tile.dart';
import 'bloc/product_details_page_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductDataModel data;
  const ProductDetailsPage({
    super.key,
    required this.data,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

List fakeRatingData = [
  ["5", 0.8, 80],
  ["4", 0.6, 12],
  ["3", 0.4, 5],
  ["2", 0.20, 3],
  ["1", 0.0, 0],
];

List<ProductReviewModel> fakeReviews = [
  ProductReviewModel(
      name: "Jennifer Rose",
      profileImage: "assets/images/girl1.png",
      description:
          "I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!",
      date: DateTime.now().toString(),
      stars: 5,
      productImages: []),
  ProductReviewModel(
      name: "Kelly Rihana",
      profileImage: "assets/images/girl2.png",
      description:
          "I'm very happy with order, It was delivered on and good quality. Recommended!",
      date: DateTime.now().toString(),
      stars: 5,
      productImages: []),
];

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ProductDetailsPageBloc productDetailsPageBloc =
      ProductDetailsPageBloc();

  List<ProductDataModel> recommendations = [];
  List availableColors = [];

  int currentColorIndex = 0;
  int currentSizeIndex = 0;
  bool selectedColor = true;
  bool selectedSize = false;
  bool _isDescriptionExpanded = true;
  bool _isReviewsExpanded = true;
  bool _isSimilarProductsExpanded = true;

  double horizontal = 20;
  double vertical = 5;

  @override
  void initState() {
    productDetailsPageBloc.add(ProductDetailsPageInitialEvent());
    for (var i = 0; i < widget.data.colors!.length; i++) {
      Color colors = Formatters().getColorName(widget.data.colors![i]);
      availableColors.add(colors);
    }
    fetchRecomendations();
    super.initState();
  }

  Future fetchRecomendations() async {
    try {
      var data = await ProductsRepository().getRecommendations();
      setState(() {
        recommendations = data;
      });
    } catch (e) {
      debugPrint("Error fetching recommendations: $e");
    }
  }

  void onFavoriteStatusChanged(bool newFavoriteStatus) {
    // Updates the product's favorite status here
    // Navigates back to the wishlist page
    Navigator.of(context).pop(newFavoriteStatus);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsPageBloc, ProductDetailsPageState>(
        bloc: productDetailsPageBloc,
        listenWhen: (previous, current) =>
            current is ProductDetailsPageActionState,
        buildWhen: (previous, current) =>
            current is! ProductDetailsPageActionState,
        listener: (context, state) {
          if (state is AddToCartActionState) {
            final snackBarState = state;
            if (snackBarState.status == true) {
              toastification.show(
                  context: context,
                  title: Text(snackBarState.message),
                  type: ToastificationType.success,
                  icon: const Icon(SecondaryIcons.cart_outlined),
                  style: ToastificationStyle.flat,
                  animationDuration: const Duration(milliseconds: 500),
                  autoCloseDuration: const Duration(milliseconds: 4500),
                  showProgressBar: false,
                  applyBlurEffect: true,
                  alignment: Alignment.topCenter);
            } else {
              toastification.show(
                  context: context,
                  title: Text(snackBarState.message),
                  type: ToastificationType.error,
                  style: ToastificationStyle.fillColored,
                  animationDuration: const Duration(milliseconds: 500),
                  autoCloseDuration: const Duration(milliseconds: 4500),
                  showProgressBar: false,
                  alignment: Alignment.topCenter);
            }
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductDetailsPageSuccessState:
              return Scaffold(
                bottomSheet: BottomAppBar(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  shape: const CircularNotchedRectangle(),
                  child: InkWell(
                    onTap: () {
                      CartItemsModel cartItems = Mappers()
                          .mapProductsFromProductDataModel(
                              widget.data, currentColorIndex, currentSizeIndex);
                      productDetailsPageBloc
                          .add(AddToCartEvent(productData: cartItems));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xff343434),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            SecondaryIcons.bag,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add To Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Image.network(widget.data.imageUrl ?? ""
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: IconButton(
                                style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(5),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white),
                                  shadowColor: MaterialStatePropertyAll(
                                    Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                                onPressed: () {
                                  onFavoriteStatusChanged(
                                      widget.data.favorite!);
                                },
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: IconButton(
                                style: ButtonStyle(
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(32, 32)),
                                  elevation: const MaterialStatePropertyAll(5),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white),
                                  shadowColor: MaterialStatePropertyAll(
                                    Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.data.favorite =
                                        !widget.data.favorite!;
                                  });
                                  productDetailsPageBloc.add(
                                      WishListButtonClickedEvent(
                                          isWishListed: widget.data.favorite!,
                                          product: widget.data));
                                },
                                icon: Icon(
                                  PrimaryIcons.heart,
                                  size: 19,
                                  color: widget.data.favorite!
                                      ? const Color(0xffFF6E6E)
                                      : const Color(0xffD8D8D8),
                                )),
                          ),
                        ],
                      ),
                      DraggableScrollableSheet(
                        initialChildSize: 0.6,
                        maxChildSize: 1.0,
                        minChildSize: 0.6,
                        builder: (context, scrollController) {
                          return Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //* -->      Product Name-starrating and price
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: horizontal,
                                        vertical: vertical),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.data.productName ?? "",
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xff1D1F22)),
                                                ),
                                                Row(
                                                  children: [
                                                    RatingBarIndicator(
                                                      rating: 4,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              const Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xff508A7B),
                                                      ),
                                                      itemCount: 5,
                                                      itemSize: 20.0,
                                                      direction:
                                                          Axis.horizontal,
                                                    ),
                                                    const Text(
                                                      "(83)",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff1D1F22)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "\$${widget.data.price}",
                                              style: const TextStyle(
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff1D1F22)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        const Divider(
                                          color: Color(0xffF3F3F6),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: horizontal,
                                        vertical: vertical),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //* select color
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Color",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff777E90)),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    for (int i = 0;
                                                        i <
                                                            widget.data.colors!
                                                                .length;
                                                        i++)
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            currentColorIndex =
                                                                i;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Stack(
                                                            children: [
                                                              Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                elevation: 2,
                                                                child:
                                                                    Container(
                                                                        decoration: BoxDecoration(
                                                                            shape: BoxShape
                                                                                .circle,
                                                                            border: Border.all(
                                                                                width: currentColorIndex == i
                                                                                    ? 3
                                                                                    : 0,
                                                                                color: Colors
                                                                                    .grey.shade500),
                                                                            boxShadow: [
                                                                              currentColorIndex == i ? BoxShadow(blurRadius: 6, color: Colors.grey.shade400, offset: const Offset(0.001, 6), spreadRadius: 0.5) : const BoxShadow()
                                                                            ]),
                                                                        child: CircleAvatar(
                                                                            radius:
                                                                                12,
                                                                            backgroundColor:
                                                                                availableColors[i])),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              ],
                                            ),

                                            //* select size
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Size",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff777E90)),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    for (int i = 0;
                                                        i <
                                                            widget.data.sizes!
                                                                .length;
                                                        i++)
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            currentSizeIndex =
                                                                i;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: CircleAvatar(
                                                            radius: 15,
                                                            backgroundColor:
                                                                currentSizeIndex ==
                                                                        i
                                                                    ? const Color(
                                                                        0xff515151)
                                                                    : const Color(
                                                                        0xffFAFAFA),
                                                            child: Text(
                                                              widget.data
                                                                  .sizes![i]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: selectedSize
                                                                      ? const Color(
                                                                          0xffFAFAFA)
                                                                      : const Color(
                                                                          0xffC5C5C5)),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          color: Color(0xffF3F3F6),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //*<-----------------------Description Section------------------------->

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: horizontal,
                                        vertical: vertical),
                                    child: ProductDetailsExpansionPanel(
                                      headingHorizontalPadding: 0,
                                      expansionCallback: (p0, p1) {
                                        setState(() {
                                          _isDescriptionExpanded =
                                              !_isDescriptionExpanded;
                                        });
                                      },
                                      isExpanded: _isDescriptionExpanded,
                                      headingText: "Description",
                                      body: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 305,
                                            height: 90,
                                            child: Text(
                                                widget.data.descriptionn ?? "",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          const Divider(
                                            color: Color(0xffF3F3F6),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //*<---------------------------Reviews Section------------------------->
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: horizontal,
                                        vertical: vertical),
                                    child: ProductDetailsExpansionPanel(
                                      headingHorizontalPadding: 0,
                                      expansionCallback: (p0, p1) {
                                        setState(() {
                                          _isReviewsExpanded =
                                              !_isReviewsExpanded;
                                        });
                                      },
                                      isExpanded: _isReviewsExpanded,
                                      headingText: "Reviews",
                                      body: Column(
                                        children: [
                                          //? AVERAGE RATINGS-------------------------->
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 5.0),
                                                    child: Text('4.9',
                                                        style: TextStyle(
                                                            fontSize: 40,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                  ),
                                                  Text('OUT OF 5',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF8A8A8F),
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: 4,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            const Icon(
                                                      Icons.star,
                                                      color: Color(0xff508A7B),
                                                    ),
                                                    itemCount: 5,
                                                    itemSize: 20.0,
                                                    direction: Axis.horizontal,
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Text('83 ratings',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0XFF8A8A8F),
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),

                                          ListView.builder(
                                            itemCount: fakeRatingData.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) =>
                                                ProductRatingProgressBar(
                                              percentage: fakeRatingData[index]
                                                  [2],
                                              starNumber: fakeRatingData[index]
                                                  [0],
                                              value: fakeRatingData[index][1],
                                            ),
                                          ),

                                          const Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("47 Reviews",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff8A8A8F),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 4.0),
                                                      child: Text(
                                                          "WRITE A REVIEW",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff8A8A8F),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ),
                                                    Icon(
                                                      SecondaryIcons
                                                          .pen_rounded,
                                                      weight: 100,
                                                      size: 16,
                                                      fill: 1.0,
                                                      color: Color(0xffC8C7CC),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          ListView.builder(
                                              itemCount: fakeReviews.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (context, index) {
                                                var data = fakeReviews[index];
                                                return ProductReviewsTile(
                                                  data: data,
                                                );
                                              }),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Divider(
                                            color: Color(0xffF3F3F6),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  recommendations.isNotEmpty
                                      ? ProductDetailsExpansionPanel(
                                          headingHorizontalPadding: 18,
                                          expansionCallback: (p0, p1) {
                                            setState(() {
                                              _isSimilarProductsExpanded =
                                                  !_isSimilarProductsExpanded;
                                            });
                                          },
                                          isExpanded:
                                              _isSimilarProductsExpanded,
                                          headingText: "Similar Product",
                                          body: ProductListViewBuilder(
                                            items: recommendations,
                                            requiredItemCount: 3,
                                          ))
                                      : const SizedBox(
                                          height: 30,
                                        ),

                                  const SizedBox(
                                    height: 50,
                                  )

                                  //Divider
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );

            default:
              return Container();
          }
        });
  }
}
