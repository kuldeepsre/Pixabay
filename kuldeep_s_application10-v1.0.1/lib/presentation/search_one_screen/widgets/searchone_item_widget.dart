import '../models/searchone_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class SearchoneItemWidget extends StatelessWidget {
  SearchoneItemWidget(
    this.searchoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SearchoneItemModel searchoneItemModelObj;

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
            searchoneItemModelObj.nikeAirMaxShoes!,
            style: CustomTextStyles.bodyMediumGray90002,
          ),
        ),
      ],
    );
  }
}
