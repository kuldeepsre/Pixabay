import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxestore/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/models/user_data_model.dart';
import 'package:fluxestore/presentation/pages/home/widgets/drawer.dart';
import 'package:fluxestore/repository/UserRepo/user_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../utils/icons_constants/primary_icons_icons.dart';
import 'package:fluxestore/presentation/pages/account/account_page.dart';
import 'package:fluxestore/presentation/pages/cart/cart_page.dart';
import 'package:fluxestore/presentation/pages/home/home.dart';
import 'package:fluxestore/presentation/pages/Search/search.dart';

import 'bloc/landing_page_bloc.dart';

class LandingPage extends StatefulWidget {
  final String token;
  const LandingPage({
    super.key,
    required this.token,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final LandingPageBloc landingPageBloc = LandingPageBloc();
  @override
  void initState() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(widget.token);
    userId = decodedToken['_id'];
    email = decodedToken['email'];
    super.initState();
  }

  fetchUserDetails(id) async {
    var results = await USerRepository().getUserDetails(id);
    if (results["status"]) {
      var userData = results['data'];
      userData.remove('__v');
      try {
        setState(() {
          user = UserModel.fromJson(userData);
        });
      } catch (e) {
        debugPrint("Error parsing user data: $e");
      }
    } else {
      debugPrint("Failed to fetch user details: ${results['message']}");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (user == null) {
      fetchUserDetails(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomePage(),
      const SearchPage(),
      CartPage(email: email,),
      AccountPage(userData: user),
    ];
    return BlocConsumer<LandingPageBloc, LandingPageInitial>(
        bloc: landingPageBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Center(
                    child: Text(
                  state.appBarName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )),
                elevation: 0,
                leading: Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: SvgPicture.asset("assets/images/menu.svg")
                        ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "notifications");
                        },
                        icon: const Icon(PrimaryIcons.bell_pin)),
                  )
                ],
              ),
              drawer: HomeDrawer(data: user),
              bottomNavigationBar: BottomNavigationBar(
                items: bottomNavItems,
                currentIndex: state.tabIndex,
                selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                elevation: 10,
                onTap: (index) {
                  var appBartext = appBarText[index];
                  landingPageBloc.add(LandingPageTabChangeEvent(
                      tabIndex: index, appBarName: appBartext));
                },
              ),
              body: pages[state.tabIndex]);
        });
  }
}

