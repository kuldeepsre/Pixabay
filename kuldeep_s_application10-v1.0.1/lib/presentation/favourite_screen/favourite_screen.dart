import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_iconbutton_two.dart';
import 'widgets/favourite_item_widget.dart';
import 'models/favourite_item_model.dart';
import 'models/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/favourite_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FavouriteBloc>(
      create: (context) => FavouriteBloc(FavouriteState(
        favouriteModelObj: FavouriteModel(),
      ))
        ..add(FavouriteInitialEvent()),
      child: FavouriteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 18.v,
            right: 20.h,
          ),
          child: BlocSelector<FavouriteBloc, FavouriteState, FavouriteModel?>(
            selector: (state) => state.favouriteModelObj,
            builder: (context, favouriteModelObj) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 204.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 21.h,
                  crossAxisSpacing: 21.h,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: favouriteModelObj?.favouriteItemList.length ?? 0,
                itemBuilder: (context, index) {
                  FavouriteItemModel model =
                      favouriteModelObj?.favouriteItemList[index] ??
                          FavouriteItemModel();
                  return FavouriteItemWidget(
                    model,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingIconbuttonTwo(
        imagePath: ImageConstant.imgAppsCircleWhiteA700,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_favourite".tr,
      ),
      actions: [
        AppbarTrailingIconbuttonTwo(
          imagePath: ImageConstant.imgFavoriteWhiteA700,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 6.v,
          ),
        ),
      ],
    );
  }
}
