import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/data/wish_listed_data.dart';
import 'package:lottie/lottie.dart';
import '../../reuseables/collections_list_tile.dart';
import 'bloc/wish_list_page_bloc.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

int tabIndex = 0;

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    wishListPageBloc.add(WishListInitialEvent());
    super.initState();
  }

  final WishListPageBloc wishListPageBloc = WishListPageBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListPageBloc, WishListPageState>(
      bloc: wishListPageBloc,
      listenWhen: (previous, current) => current is WishListActionState,
      buildWhen: (previous, current) => current is! WishListActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case WishListProductClickedActionState:
            final productState = state as WishListProductClickedActionState;
             Navigator.of(context).pushNamed(
                "productDetails",
                arguments: productState.productDataModel);

            break;
          default:
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistSuccessState:
            final wishListSuccessState = state as WishlistSuccessState;
            return Scaffold(
                appBar: AppBar(
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          )),
                    ),
                    title: const Text(
                      "My Wishlist",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Colors.white),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                tabIndex = 0;
                              });
                            },
                            child: Container(
                              width: 148,
                              height: 36,
                              decoration: BoxDecoration(
                                  color: tabIndex == 0
                                      ? Colors.black
                                      : Colors.white,
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Center(
                                child: Text(
                                  "All items",
                                  style: TextStyle(
                                      color: tabIndex == 0
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                tabIndex = 1;
                              });
                            },
                            child: Container(
                              width: 148,
                              height: 36,
                              decoration: BoxDecoration(
                                  color: tabIndex == 1
                                      ? Colors.black
                                      : Colors.white,
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Center(
                                child: Text(
                                  "Boards",
                                  style: TextStyle(
                                      color: tabIndex == 0
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                 wishListSuccessState.wishlistedItemsList.isEmpty ?   Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/lottie/empty_wishList_lottie.json"),
                      ],
                    ),
                  ) :
                     Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: GridView.builder(
                          itemCount: wishListedItems.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 5,
                            crossAxisSpacing: 4.0, 
                            mainAxisSpacing: 4.0,
                          ),

                          itemBuilder: (context, index) {
                            var data =
                                wishListSuccessState.wishlistedItemsList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 10),
                              child: InkWell(
                                onTap: () {
                                  wishListPageBloc.add(
                                      WishListProductCleckedEvent(
                                          productDataModel: data));
                                },
                                child: CollectionsListTile(
                                  product: data,
                                  wishListPageBloc: wishListPageBloc,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ));
        }
        return const SizedBox();
      },
    );
  }
}
