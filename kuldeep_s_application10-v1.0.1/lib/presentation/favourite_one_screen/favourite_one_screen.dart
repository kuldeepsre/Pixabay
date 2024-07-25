import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'widgets/favouriteone_item_widget.dart';
import 'models/favouriteone_item_model.dart';
import 'models/favourite_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/favourite_one_bloc.dart';

class FavouriteOneScreen extends StatelessWidget {
  const FavouriteOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FavouriteOneBloc>(
      create: (context) => FavouriteOneBloc(FavouriteOneState(
        favouriteOneModelObj: FavouriteOneModel(),
      ))
        ..add(FavouriteOneInitialEvent()),
      child: FavouriteOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 18.v,
            right: 20.h,
          ),
          child: BlocSelector<FavouriteOneBloc, FavouriteOneState,
              FavouriteOneModel?>(
            selector: (state) => state.favouriteOneModelObj,
            builder: (context, favouriteOneModelObj) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 204.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 21.h,
                  crossAxisSpacing: 21.h,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    favouriteOneModelObj?.favouriteoneItemList.length ?? 0,
                itemBuilder: (context, index) {
                  FavouriteoneItemModel model =
                      favouriteOneModelObj?.favouriteoneItemList[index] ??
                          FavouriteoneItemModel();
                  return FavouriteoneItemWidget(
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
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgAppsCircle,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_favourite".tr,
      ),
      actions: [
        AppbarTrailingIconbuttonOne(
          imagePath: ImageConstant.imgFavorite,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 6.v,
          ),
        ),
      ],
    );
  }
}
