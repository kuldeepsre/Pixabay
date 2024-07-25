import '../models/detailsone_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class DetailsoneItemWidget extends StatelessWidget {
  DetailsoneItemWidget(
    this.detailsoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DetailsoneItemModel detailsoneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.h,
      child: CustomImageView(
        imagePath: detailsoneItemModelObj?.group,
        height: 56.adaptSize,
        width: 56.adaptSize,
      ),
    );
  }
}
