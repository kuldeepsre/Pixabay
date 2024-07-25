import '../models/frame2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class Frame2ItemWidget extends StatelessWidget {
  Frame2ItemWidget(
    this.frame2ItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  Frame2ItemModel frame2ItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 12.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        frame2ItemModelObj.widget!,
        style: TextStyle(
          color: (frame2ItemModelObj.isSelected ?? false)
              ? appTheme.whiteA700
              : appTheme.gray600,
          fontSize: 16.fSize,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (frame2ItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.gray90001,
      selectedShadowColor: appTheme.blueGray90066,
      elevation: 2,
      selectedColor: theme.colorScheme.primary,
      shape: (frame2ItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                22.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                22.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
