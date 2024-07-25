import 'package:flutter/material.dart';
import '../models/tab_catagory_model.dart';
import '../models/user_data_model.dart';
import '../utils/icons_constants/primary_icons_icons.dart';
import '../utils/icons_constants/secondary_icons_icons.dart';

const List<String> appBarText = ["Fluxestore", "Search", "Cart", "Account"];

const List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: Icon(
        PrimaryIcons.home,
      ),
      label: "Home"),
  BottomNavigationBarItem(icon: Icon(PrimaryIcons.search), label: "Search"),
  BottomNavigationBarItem(
      icon: Icon(
        SecondaryIcons.cart_outlined,
      ),
      label: "Shop"),
  BottomNavigationBarItem(icon: Icon(PrimaryIcons.profile), label: "Account"),
];

late String userId;
late String email;
UserModel? user;


List<TabCategoryModel> categoryList = [
  TabCategoryModel("Pending", true),
  TabCategoryModel("Delivered", false),
  TabCategoryModel("Cancelled", false),
];