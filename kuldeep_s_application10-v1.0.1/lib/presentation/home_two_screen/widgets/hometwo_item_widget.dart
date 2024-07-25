import '../models/hometwo_item_model.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class HometwoItemWidget extends StatelessWidget {
  HometwoItemWidget(
    this.hometwoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HometwoItemModel hometwoItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillGray900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: 157.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.v),
          CustomImageView(
            imagePath: hometwoItemModelObj?.bestSeller,
            height: 81.v,
          ),
          SizedBox(height: 19.v),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hometwoItemModelObj.bestSeller1!,
                        style: theme.textTheme.bodySmall,
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        hometwoItemModelObj.nikeJordan!,
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 10.v),
                      Text(
                        hometwoItemModelObj.price!,
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 21.h,
                    top: 44.v,
                  ),
                  child: CustomIconButton(
                    height: 35.v,
                    width: 34.h,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgClosePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
