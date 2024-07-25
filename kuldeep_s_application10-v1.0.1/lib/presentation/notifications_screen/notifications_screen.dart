import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:grouped_list/grouped_list.dart';
import 'models/today2_item_model.dart';
import '../notifications_screen/widgets/today2_item_widget.dart';
import 'models/notifications_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/notifications_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationsBloc>(
      create: (context) => NotificationsBloc(NotificationsState(
        notificationsModelObj: NotificationsModel(),
      ))
        ..add(NotificationsInitialEvent()),
      child: NotificationsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.h, 18.v, 23.h, 5.v),
          child: BlocSelector<NotificationsBloc, NotificationsState,
              NotificationsModel?>(
            selector: (state) => state.notificationsModelObj,
            builder: (context, notificationsModelObj) {
              return GroupedListView<Today2ItemModel, String>(
                shrinkWrap: true,
                stickyHeaderBackgroundColor: Colors.transparent,
                elements: notificationsModelObj?.today2ItemList ?? [],
                groupBy: (element) => element.groupBy!,
                sort: false,
                groupSeparatorBuilder: (String value) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 40.v,
                      bottom: 13.v,
                    ),
                    child: Column(
                      children: [
                        Text(
                          value,
                          style: CustomTextStyles.titleMedium18.copyWith(
                            color: appTheme.whiteA700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemBuilder: (context, model) {
                  return Today2ItemWidget(
                    model,
                  );
                },
                separator: SizedBox(
                  height: 24.v,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingIconbuttonTwo(
        imagePath: ImageConstant.imgAppsCircleWhiteA700,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_notifications".tr,
      ),
      actions: [
        AppbarSubtitleTwo(
          text: "lbl_clear_all".tr,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 18.v,
          ),
        ),
      ],
    );
  }
}
