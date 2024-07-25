import 'package:flutter/material.dart';
import 'package:fluxestore/data/collections_data.dart';
import 'package:fluxestore/models/banners_data_model.dart';
import 'package:fluxestore/presentation/reuseables/collections_list_tile.dart';

import 'wish_list_page/bloc/wish_list_page_bloc.dart';

class CollectionsPage extends StatelessWidget {
  final BannersDataModel bannerData;
  CollectionsPage({super.key, required this.bannerData});
  final WishListPageBloc wishListPageBloc = WishListPageBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            child: Image.network(
              width: double.infinity,
              height: 270,
              bannerData.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: IconButton(
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(5),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      shadowColor: MaterialStatePropertyAll(
                        Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 44, top: 51),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Text(
                    bannerData.title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            maxChildSize: 1.0,
            minChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SizedBox(
                  height: double.infinity,
                  width: 141,
                  child: GridView.builder(
                    itemCount: seasonCollectionsData.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 5,
                      crossAxisSpacing: 8, 
                      mainAxisSpacing: 8,
                    ),
                    controller:
                        scrollController,

                    itemBuilder: (context, index) {
                      var data = seasonCollectionsData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
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
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
