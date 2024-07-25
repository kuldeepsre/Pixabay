import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/filter_bloc.dart';

// ignore_for_file: must_be_immutable
class FilterBottomsheet extends StatelessWidget {
  const FilterBottomsheet({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FilterBloc>(
      create: (context) => FilterBloc(FilterState(
        filterModelObj: FilterModel(),
      ))
        ..add(FilterInitialEvent()),
      child: FilterBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60.h,
            child: Divider(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(height: 24.v),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_filters".tr,
                  style: CustomTextStyles.headlineSmallGray90002,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 97.h,
                    top: 7.v,
                    bottom: 8.v,
                  ),
                  child: Text(
                    "lbl_reset".tr.toUpperCase(),
                    style: CustomTextStyles.bodySmallGray600,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(height: 16.v),
          CustomElevatedButton(
            text: "lbl_apply".tr,
          ),
        ],
      ),
    );
  }
}
