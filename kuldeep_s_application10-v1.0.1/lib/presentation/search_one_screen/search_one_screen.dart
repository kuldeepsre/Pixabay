import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:kuldeep_s_application10/widgets/custom_search_view.dart';
import 'widgets/searchone_item_widget.dart';
import 'models/searchone_item_model.dart';
import 'models/search_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/search_one_bloc.dart';

class SearchOneScreen extends StatelessWidget {
  const SearchOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchOneBloc>(
      create: (context) => SearchOneBloc(SearchOneState(
        searchOneModelObj: SearchOneModel(),
      ))
        ..add(SearchOneInitialEvent()),
      child: SearchOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              BlocSelector<SearchOneBloc, SearchOneState,
                  TextEditingController?>(
                selector: (state) => state.searchController,
                builder: (context, searchController) {
                  return CustomSearchView(
                    controller: searchController,
                    hintText: "msg_search_your_shoes".tr,
                  );
                },
              ),
              SizedBox(height: 22.v),
              Text(
                "lbl_shoes".tr,
                style: CustomTextStyles.titleMediumGray90002,
              ),
              SizedBox(height: 15.v),
              _buildSearchOne(context),
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
  Widget _buildSearchOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 168.h),
      child: BlocSelector<SearchOneBloc, SearchOneState, SearchOneModel?>(
        selector: (state) => state.searchOneModelObj,
        builder: (context, searchOneModelObj) {
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
            itemCount: searchOneModelObj?.searchoneItemList.length ?? 0,
            itemBuilder: (context, index) {
              SearchoneItemModel model =
                  searchOneModelObj?.searchoneItemList[index] ??
                      SearchoneItemModel();
              return SearchoneItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
