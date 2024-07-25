import '../models/today2_item_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class Today2ItemWidget extends StatelessWidget {
  Today2ItemWidget(
    this.today2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Today2ItemModel today2ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                ImageConstant.imgGroup144Gray900,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgNikeEpicReact57x83,
            height: 57.v,
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.h,
            top: 7.v,
            bottom: 7.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 139.h,
                child: Text(
                  "msg_we_have_new_products".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall!.copyWith(
                    height: 1.57,
                  ),
                ),
              ),
              SizedBox(height: 6.v),
              Row(
                children: [
                  Text(
                    "lbl_364_95".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text(
                      "lbl_260_00".tr,
                      style: CustomTextStyles.titleSmallGray600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24.h,
            bottom: 41.v,
          ),
          child: Column(
            children: [
              Text(
                "lbl_6_min_ago".tr,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 15.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 8.adaptSize,
                  width: 8.adaptSize,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      4.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
