import '../models/mycartone_item_model.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class MycartoneItemWidget extends StatelessWidget {
  MycartoneItemWidget(
    this.mycartoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MycartoneItemModel mycartoneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 85.v,
          width: 87.h,
          padding: EdgeInsets.symmetric(
            horizontal: 1.h,
            vertical: 13.v,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusStyle.roundedBorder16,
            image: DecorationImage(
              image: fs.Svg(
                ImageConstant.imgGroup144,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomImageView(
            imagePath: mycartoneItemModelObj?.nikeClubMax,
            height: 57.v,
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 224.h,
                margin: EdgeInsets.only(right: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mycartoneItemModelObj.nikeClubMax1!,
                          style: CustomTextStyles.titleMediumGray90002_1,
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          mycartoneItemModelObj.price!,
                          style: CustomTextStyles.titleSmallGray90002,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 2.v,
                        bottom: 22.v,
                      ),
                      child: Text(
                        mycartoneItemModelObj.l!,
                        style: CustomTextStyles.titleSmallGray90002,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.v),
              SizedBox(
                width: 232.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 89.h,
                      margin: EdgeInsets.only(top: 2.v),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            padding: EdgeInsets.all(8.h),
                            decoration: IconButtonStyleHelper.fillWhiteATL12,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgGroup61,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.v),
                            child: Text(
                              mycartoneItemModelObj.one!,
                              style:
                                  CustomTextStyles.bodyMediumSwitzerOnPrimary,
                            ),
                          ),
                          CustomIconButton(
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            padding: EdgeInsets.all(8.h),
                            decoration: IconButtonStyleHelper.fillPrimary,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgCloseWhiteA700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomImageView(
                      imagePath: mycartoneItemModelObj?.image,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
