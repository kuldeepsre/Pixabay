import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/checkout_bloc.dart';

// ignore_for_file: must_be_immutable
class CheckoutDialog extends StatelessWidget {
  const CheckoutDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<CheckoutBloc>(
      create: (context) => CheckoutBloc(CheckoutState(
        checkoutModelObj: CheckoutModel(),
      ))
        ..add(CheckoutInitialEvent()),
      child: CheckoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.h,
      padding: EdgeInsets.symmetric(
        horizontal: 60.h,
        vertical: 40.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 134.adaptSize,
            width: 134.adaptSize,
            padding: EdgeInsets.all(24.h),
            decoration: AppDecoration.fillBlue.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder65,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgImage50,
              height: 86.adaptSize,
              width: 86.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 25.v),
          Container(
            width: 150.h,
            margin: EdgeInsets.only(
              left: 31.h,
              right: 32.h,
            ),
            child: Text(
              "msg_your_payment_is".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleLargeGray90002.copyWith(
                height: 1.40,
              ),
            ),
          ),
          SizedBox(height: 28.v),
          CustomElevatedButton(
            text: "msg_back_to_shopping".tr,
          ),
        ],
      ),
    );
  }
}
