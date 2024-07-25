import '../models/search_item_model.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class SearchItemWidget extends StatelessWidget {
  SearchItemWidget(
    this.searchItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SearchItemModel searchItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgTime,
          height: 22.adaptSize,
          width: 22.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: Text(
            searchItemModelObj.nikeAirMaxShoes!,
            style: CustomTextStyles.bodyMediumOnPrimaryContainer,
          ),
        ),
      ],
    );
  }
}
