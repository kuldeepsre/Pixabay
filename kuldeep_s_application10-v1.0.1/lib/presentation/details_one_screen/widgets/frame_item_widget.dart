import '../models/frame_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class FrameItemWidget extends StatelessWidget {
  FrameItemWidget(
    this.frameItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  FrameItemModel frameItemModelObj;

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
        frameItemModelObj.widget!,
        style: TextStyle(
          color: (frameItemModelObj.isSelected ?? false)
              ? appTheme.whiteA700
              : appTheme.gray600,
          fontSize: 16.fSize,
          fontFamily: 'Airbnb Cereal App',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (frameItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.gray50,
      selectedShadowColor: theme.colorScheme.primary.withOpacity(0.4),
      elevation: 2,
      selectedColor: theme.colorScheme.primary,
      shape: (frameItemModelObj.isSelected ?? false)
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
