import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:kuldeep_s_application10/widgets/custom_search_view.dart';
import 'widgets/search_item_widget.dart';
import 'models/search_item_model.dart';
import 'models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(SearchState(
        searchModelObj: SearchModel(),
      ))
        ..add(SearchInitialEvent()),
      child: SearchScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 18.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocSelector<SearchBloc, SearchState, TextEditingController?>(
                selector: (state) => state.searchController,
                builder: (context, searchController) {
                  return CustomSearchView(
                    controller: searchController,
                    hintText: "msg_search_your_shoes".tr,
                    borderDecoration: SearchViewStyleHelper.fillGray,
                    fillColor: appTheme.gray900,
                  );
                },
              ),
              SizedBox(height: 22.v),
              Text(
                "lbl_shoes".tr,
                style: CustomTextStyles.titleMedium18,
              ),
              SizedBox(height: 15.v),
              _buildSearch(context),
            ],
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
        text: "lbl_search".tr,
      ),
      actions: [
        AppbarSubtitleTwo(
          text: "lbl_cancel".tr,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 18.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 168.h),
      child: BlocSelector<SearchBloc, SearchState, SearchModel?>(
        selector: (state) => state.searchModelObj,
        builder: (context, searchModelObj) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 16.v,
              );
            },
            itemCount: searchModelObj?.searchItemList.length ?? 0,
            itemBuilder: (context, index) {
              SearchItemModel model =
                  searchModelObj?.searchItemList[index] ?? SearchItemModel();
              return SearchItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
