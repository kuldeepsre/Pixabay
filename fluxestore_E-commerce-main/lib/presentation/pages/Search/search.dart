import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxestore/models/product_data_model.dart';
import 'package:fluxestore/presentation/pages/Search/bloc/search_page_bloc.dart';
import 'package:fluxestore/presentation/pages/Search/widgets/filer_drawer.dart';
import 'package:fluxestore/presentation/pages/Search/widgets/showcase_cards.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/icons_constants/primary_icons_icons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchPageBloc searchbloc = SearchPageBloc();

  @override
  void initState() {
    searchbloc.add(SearchPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 246,
                        height: 46,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 12,
                                  color: Colors.grey,
                                  offset: Offset(0, 1),
                                  spreadRadius: -10),
                              // BoxShadow(
                              //   blurRadius: 10,
                              //   color: Color.fromARGB(255, 44, 40, 40),
                              //   offset: Offset(0, 2)
                              // )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              const Icon(
                                PrimaryIcons.search,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: TextField(
                                    onChanged: (value) {
                                      searchbloc.add(SearchPageOnSearchEvent(
                                          query: value));
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: 51,
                      height: 46,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 15,
                                color: Colors.grey,
                                offset: Offset(0, 5),
                                spreadRadius: -12),
                            // BoxShadow(
                            //   blurRadius: 10,
                            //   color: Color.fromARGB(255, 44, 40, 40),
                            //   offset: Offset(0, 2)
                            // )
                          ]),
                      child: Builder(builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon:
                              // SecondaryIcons.filter_outlined,
                              SvgPicture.asset(
                                  "assets/images/search_filter.svg"),
                          // color: const Color(0xff777E90),
                        );
                      }))
                ],
              ),

              //* To USE A LIST VIEW OR LIST VIEW BUILDER INSIDE A COLUMN(NORMAL USECASE) -
              //* -USE EXPANDED WIDGET TO WRAP THE CHILD LIST VIEW
              BlocConsumer<SearchPageBloc, SearchPageState>(
                  bloc: searchbloc,
                  listenWhen: (previous, current) =>
                      current is SearchPageActionState,
                  buildWhen: (previous, current) =>
                      current is! SearchPageActionState,
                  listener: (context, state) {},
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case SearchPageShowCaseState:
                        return const ShowcaseItemcards();
                      case SearchLoadingState:
                        return Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount:
                                  5, // Change this to your desired number of list tiles
                              itemBuilder: (context, index) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey[300],
                                      radius: 25,
                                    ),
                                    title: Container(
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    subtitle: Container(
                                      width: 150,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      case SearchLoadedSucessstate:
                        final successState = state as SearchLoadedSucessstate;
                        return Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: successState.responseItems.length,
                              itemBuilder: (context, index) {
                                ProductDataModel data =
                                    successState.responseItems[index];
                                return InkWell(
                                  onTap: () => Navigator.of(context).pushNamed(
                                      "productDetails",
                                      arguments: data),
                                  child: ListTile(
                                      leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                              data.imageUrl ?? '')),
                                      title: Text(data.productName ?? ''),
                                      subtitle:
                                          Text("\$${data.price.toString()}")),
                                );
                              },
                            ),
                          ),
                        );
                      case SearchPageNoResponseState:
                        return Column(
                          children: [
                            Lottie.asset("assets/lottie/no-search-results.json",
                                reverse: true),
                            const Text("No results found!")
                          ],
                        );
                    }
                    return const SizedBox();
                  })
            ],
          ),
        ),
        endDrawer: const FilterDrawer());
  }
}

// class CustomSliderThumbShape extends SliderComponentShape {
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return const Size(14.0, 28.0); // Adjust the size of the thumb as needed
//   }

//   @override
//   void paint(PaintingContext context, Offset center,
//       {required Animation<double> activationAnimation,
//       required Animation<double> enableAnimation,
//       required bool isDiscrete,
//       required TextPainter labelPainter,
//       required RenderBox parentBox,
//       required SliderThemeData sliderTheme,
//       required TextDirection textDirection,
//       required double value,
//       required double textScaleFactor,
//       required Size sizeWithOverflow}) {
//     final Canvas canvas = context.canvas;

//     final paint = Paint()
//       ..color = Colors.transparent // Transparent fill color for the thumb
//       ..strokeWidth = 2.0 // Border width
//       ..style = PaintingStyle.stroke;

//     canvas.drawCircle(center, 14.0, paint); // Adjust the radius for the thumb

//     final borderPaint = Paint()
//       ..color = Colors.black // Border color
//       ..strokeWidth = 2.0 // Border width
//       ..style = PaintingStyle.stroke;

//     canvas.drawCircle(center, 14.0, borderPaint); // Ad
//   }
// }
