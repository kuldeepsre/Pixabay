import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/presentation/pages/home/bloc/home_bloc.dart';
import 'package:fluxestore/presentation/pages/home/widgets/home_page_shimmers.dart';
import 'package:fluxestore/presentation/reuseables/banner_cards.dart';
import 'package:fluxestore/presentation/reuseables/circle_tabs.dart';
import 'package:fluxestore/presentation/pages/home/widgets/curosal_slide_widget_banner.dart';
import 'package:fluxestore/presentation/reuseables/product_list_view_builder.dart';
import 'package:fluxestore/presentation/reuseables/row_heading_seemore.dart';
import 'package:fluxestore/presentation/pages/home/widgets/vertical_banner_last.dart';

import '../../../utils/icons_constants/primary_icons_icons.dart';
import '../../reuseables/recommended_products_.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final HomePageBloc homePageBloc = HomePageBloc();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homePageBloc.add(HomePageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hori = 25;
    double vert = 15;
    final double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomePageLoadingState:
            return const HomePageLoadingShimmers();
          case HomePageLoadedSuccessState:
            final successState = state as HomePageLoadedSuccessState;
            return Scaffold(
              body: ListView(scrollDirection: Axis.vertical, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: hori, vertical: vert),
                      child: const SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //It will be functionable on next update
                            CircleTab(
                              icon: PrimaryIcons.vector,
                              isSelected: true,
                              data: "Women",
                              // iconSize: 20,
                            ),
                            CircleTab(
                              icon: PrimaryIcons.vector_1,
                              isSelected: false,
                              data: "Men",
                              // iconSize: 20,
                            ),
                            CircleTab(
                              icon: PrimaryIcons.glasses,
                              isSelected: false,
                              data: "Accessories",
                              // iconSize: 20,
                            ),
                            CircleTab(
                              icon: PrimaryIcons.group_33110,
                              isSelected: false,
                              data: "Beauty",
                              // iconSize: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: hori, vertical: vert),
                      child: CurosalSliderWidget(
                          banners: successState.loadedBannersList),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: hori, vertical: vert),
                      child:  RowHeadsSeeMore(
                          text1: "Feature Products", text2: "Show all",
                          onTapseeMore: ()=>  Navigator.of(context).pushNamed("productsPage"),
                          ),
                    ),
                    ProductListViewBuilder(
                      items: successState.loadedProductsList,
                      requiredItemCount: 4,
                    ),
                    const BannerCards(
                        height: 162,
                        top: 30,
                        left: 35,
                        right: 35,
                        bottom: 0,
                        liteText: "| NEW COLLECTION",
                        mainText: "HANG OUT & PARTY",
                        imagePath: "assets/images/glass.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: hori, vertical: vert),
                      child:  RowHeadsSeeMore(
                          text1: "Recommended", text2: "Show all",
                          onTapseeMore: ()=>  Navigator.of(context).pushNamed("productsPage"),
                          ),
                    ),
                    RecomendedProductsListTile(
                      recomenedItemsData: successState.loadedProductsList,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: hori, vertical: vert),
                      child:  RowHeadsSeeMore(
                          text1: "Top Collection", text2: "Show all",
                          onTapseeMore: ()=>  Navigator.of(context).pushNamed("productsPage"),
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: hori, vertical: vert),
                      child: InkWell(
                        onTap: ()=>  Navigator.of(context).pushNamed("productsPage"),
                        child: const BannerCards(
                            height: 158,
                            top: 20,
                            left: 20,
                            right: 10,
                            bottom: 10,
                            liteText: "| SALE UPTO 40%",
                            mainText: "FOR SLIM & BEAUTY",
                            imagePath: "assets/images/yellow.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: hori, vertical: vert),
                      child: InkWell(
                        onTap: ()=>  Navigator.of(context).pushNamed("productsPage"),
                        child: const BannerCards(
                          height: 210,
                          top: 35,
                          left: 20,
                          right: 0,
                          bottom: 10,
                          liteText: "| WINTER COLLECTION ",
                          mainText: "Most sexy & fabulous design ",
                          imagePath: "assets/images/coatNew.png",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: hori, vertical: vert),
                      child: VerticalCards(
                        screenWidth: screenWidth,
                      ),
                    )
                  ],
                ),
              ]),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
