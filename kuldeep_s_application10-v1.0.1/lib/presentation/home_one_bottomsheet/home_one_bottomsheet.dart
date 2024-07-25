import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/home_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/home_one_bloc.dart';

// ignore_for_file: must_be_immutable
class HomeOneBottomsheet extends StatelessWidget {
  const HomeOneBottomsheet({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeOneBloc>(
      create: (context) => HomeOneBloc(HomeOneState(
        homeOneModelObj: HomeOneModel(),
      ))
        ..add(HomeOneInitialEvent()),
      child: HomeOneBottomsheet(),
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
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60.h,
            child: Divider(
              color: appTheme.gray50,
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
                  style: theme.textTheme.headlineSmall,
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
