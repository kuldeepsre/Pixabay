import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:grouped_list/grouped_list.dart';
import 'models/today_item_model.dart';
import '../notifications_one_screen/widgets/today_item_widget.dart';
import 'models/notifications_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/notifications_one_bloc.dart';

class NotificationsOneScreen extends StatelessWidget {
  const NotificationsOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationsOneBloc>(
      create: (context) => NotificationsOneBloc(NotificationsOneState(
        notificationsOneModelObj: NotificationsOneModel(),
      ))
        ..add(NotificationsOneInitialEvent()),
      child: NotificationsOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.h, 18.v, 23.h, 5.v),
          child: BlocSelector<NotificationsOneBloc, NotificationsOneState,
              NotificationsOneModel?>(
            selector: (state) => state.notificationsOneModelObj,
            builder: (context, notificationsOneModelObj) {
              return GroupedListView<TodayItemModel, String>(
                shrinkWrap: true,
                stickyHeaderBackgroundColor: Colors.transparent,
                elements: notificationsOneModelObj?.todayItemList ?? [],
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
                          style: CustomTextStyles.titleMediumGray90002.copyWith(
                            color: appTheme.gray90002,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemBuilder: (context, model) {
                  return TodayItemWidget(
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
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgAppsCircle,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
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
