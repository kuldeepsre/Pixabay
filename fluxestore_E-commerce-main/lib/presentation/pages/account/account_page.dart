import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/models/user_data_model.dart';
import 'package:fluxestore/presentation/pages/account/bloc/account_page_bloc.dart';
import 'package:fluxestore/presentation/pages/account/widgets/logout_dialog.dart';

import 'package:fluxestore/presentation/reuseables/account_page_utils_row.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/icons_constants/primary_icons_icons.dart';
import '../../../utils/icons_constants/secondary_icons_icons.dart';

class AccountPage extends StatefulWidget {
  final UserModel? userData;
  const AccountPage({super.key, required this.userData});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late SharedPreferences prefs;

  initPrefs() async => prefs = await SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  final AccountPageBloc accountPageBloc = AccountPageBloc();
  final repoUrl = Uri.parse("https://github.com/Nilav2608/fluxestore_E-commerce");

  showUnableToLaunchUtlError() {
    toastification.show(
        context: context,
        title: const Text("An Error occurd!"),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        animationDuration: const Duration(milliseconds: 600),
        autoCloseDuration: const Duration(milliseconds: 4500),
        showProgressBar: false,
        alignment: Alignment.bottomCenter);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocListener<AccountPageBloc, AccountPageState>(
        bloc: accountPageBloc,
        listener: (context, state) {
          if (state is NavigateToMyordersPageActionState) {
            Navigator.of(context).pushNamed("MyOrders");
          }
          if (state is NavigateToWishListPageActionState) {
            Navigator.of(context).pushNamed("WishListPage");
          }
          if (state is AccountPageLoadingState) {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black87,
                      ),
                    ));
          }
          if (state is AccountPageLogOutConfirmationActionState) {
            showDialog(
                context: context,
                builder: (context) =>
                    LogOutConformationDialog(onLogout: () async {
                      accountPageBloc
                          .add(AccountPageLogoutConfirmedEvent(prefs: prefs));
                      Navigator.of(context).pop();
                    }));
          }
          if (state is LogoutSuccessActionState) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("Authentication", (route) => false);
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset("assets/images/avatar.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 45,
                          // ),
                          Text(
                            widget.userData!.userName ?? "Susane Pham",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.userData!.email ?? "sunieux@gmail.com",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Color(0xff130F26),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenWidth * 0.85,
              height: screenHeight * 0.40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  AccountPageUtilsRow(
                    onTap: () => accountPageBloc
                        .add(AccountPageNavigateToMyOrdersPageEvent()),
                    icon: SecondaryIcons.bag,
                    text: "My Orders",
                    size: 21,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      )),
                  //? For next release!
                  // const AccountPageUtilsRow(
                  //   icon: SecondaryIcons.wallet,
                  //   text: "Payment method",
                  //   size: 20,
                  // ),
                  // const Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: Divider(
                  //       color: Color(0xffF3F3F6),
                  //     )),
                  // const AccountPageUtilsRow(
                  //   icon: SecondaryIcons.ticket,
                  //   text: "Voucher",
                  //   size: 19,
                  // ),
                  // const Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: Divider(
                  //       color: Color(0xffF3F3F6),
                  //     )),
                  AccountPageUtilsRow(
                    onTap: () => accountPageBloc
                        .add(AccountPageNavigateToWishListPageEvent()),
                    icon: PrimaryIcons.heart,
                    text: "My Wishlist",
                    size: 23,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      )),
                  AccountPageUtilsRow(
                    onTap: () async {
                      if (await canLaunchUrl(repoUrl)) {
                        await launchUrl(repoUrl);
                      } else {
                        showUnableToLaunchUtlError();
                        throw throw Exception('Could not launch $repoUrl');
                      }
                    },
                    icon: Icons.star,
                    text: "Rate this app",
                    size: 23,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      )),
                  AccountPageUtilsRow(
                    onTap: () {
                      accountPageBloc.add(AccountPageLogOutEvent());
                    },
                    icon: SecondaryIcons.logout,
                    text: "Log out",
                    size: 21,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
