import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbuttonThree extends StatelessWidget {
  AppbarLeadingIconbuttonThree({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          decoration: IconButtonStyleHelper.fillGrayTL22,
          child: CustomImageView(
            imagePath: ImageConstant.imgUserWhiteA700,
          ),
        ),
      ),
    );
  }
}
