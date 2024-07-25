import '../models/bestsellerone_item_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class BestselleroneItemWidget extends StatelessWidget {
  BestselleroneItemWidget(
    this.bestselleroneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BestselleroneItemModel bestselleroneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 12.v,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder16,
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup207Gray900,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 7.v),
          CustomImageView(
            imagePath: bestselleroneItemModelObj?.bestSeller,
            height: 83.v,
          ),
          SizedBox(height: 13.v),
          Text(
            bestselleroneItemModelObj.bestSeller1!,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 3.v),
          Text(
            bestselleroneItemModelObj.nikeAirForce!,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 1.v),
          Text(
            bestselleroneItemModelObj.menSShoes!,
            style: CustomTextStyles.bodySmallWorkSansGray600,
          ),
          SizedBox(height: 12.v),
          Row(
            children: [
              Text(
                bestselleroneItemModelObj.price!,
                style: theme.textTheme.titleMedium,
              ),
              CustomImageView(
                imagePath: bestselleroneItemModelObj?.image,
                height: 16.v,
                margin: EdgeInsets.only(
                  left: 30.h,
                  bottom: 3.v,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
