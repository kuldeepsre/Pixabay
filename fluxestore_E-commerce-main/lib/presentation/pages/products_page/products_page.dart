import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../reuseables/collections_list_tile.dart';
import '../wish_list_page/bloc/wish_list_page_bloc.dart';
import 'bloc/products_page_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsPageBloc productsPageBloc = ProductsPageBloc();
  final WishListPageBloc wishListPageBloc = WishListPageBloc();

  @override
  void initState() {
    productsPageBloc.add(ProductsPageInitialevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        body: BlocConsumer<ProductsPageBloc, ProductsPageState>(
            bloc: productsPageBloc,
            listenWhen: (previous, current) =>
                current is ProductsPageActionState,
            buildWhen: (previous, current) =>
                current is! ProductsPageActionState,
            listener: (BuildContext context, ProductsPageState state) {},
            builder: (BuildContext context, ProductsPageState state) {
              switch (state.runtimeType) {
                case ProductPageLoadingState:
                  return GridView.builder(
                    itemCount: 8,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 5,
                      crossAxisSpacing: 8, // Adjust spacing as needed
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[200]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 141,
                                  height: 186,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 100,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 56,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 120,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                case ProductPageSuccessState:
                  final successData = state as ProductPageSuccessState;
                  return GridView.builder(
                    itemCount: successData.products.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 5,
                      crossAxisSpacing: 8,//calculateSpacing(context),
                      mainAxisSpacing: 8,//calculateSpacing(context),
                    ),
                    itemBuilder: (context, index) {
                      var data = successData.products[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 5),
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed("productDetails", arguments: data),
                          child: CollectionsListTile(
                            product: data,
                            wishListPageBloc: wishListPageBloc,
                          ),
                        ),
                      );
                    },
                  );
              }
              return const SizedBox();
            }));
  }
}
