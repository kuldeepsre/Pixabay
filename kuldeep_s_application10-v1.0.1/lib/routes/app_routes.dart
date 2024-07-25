import 'package:flutter/material.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/onboard_one_one_screen/onboard_one_one_screen.dart';
import '../presentation/onboard_two_screen/onboard_two_screen.dart';
import '../presentation/onboard_three_screen/onboard_three_screen.dart';
import '../presentation/sign_in_one_screen/sign_in_one_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';
import '../presentation/foget_password_one_screen/foget_password_one_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/details_one_screen/details_one_screen.dart';
import '../presentation/favourite_one_screen/favourite_one_screen.dart';
import '../presentation/my_cart_one_screen/my_cart_one_screen.dart';
import '../presentation/checkout_three_screen/checkout_three_screen.dart';
import '../presentation/notifications_one_screen/notifications_one_screen.dart';
import '../presentation/best_seller_screen/best_seller_screen.dart';
import '../presentation/side_menu_one_screen/side_menu_one_screen.dart';
import '../presentation/account_settings_screen/account_settings_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/search_one_screen/search_one_screen.dart';
import '../presentation/splash_one_screen/splash_one_screen.dart';
import '../presentation/onboard_one_screen/onboard_one_screen.dart';
import '../presentation/onboard_two_one_screen/onboard_two_one_screen.dart';
import '../presentation/onboard_three_one_screen/onboard_three_one_screen.dart';
import '../presentation/sign_in_screen/sign_in_screen.dart';
import '../presentation/sign_up_one_screen/sign_up_one_screen.dart';
import '../presentation/foget_password_screen/foget_password_screen.dart';
import '../presentation/home_two_screen/home_two_screen.dart';
import '../presentation/details_screen/details_screen.dart';
import '../presentation/favourite_screen/favourite_screen.dart';
import '../presentation/my_cart_screen/my_cart_screen.dart';
import '../presentation/checkout_two_screen/checkout_two_screen.dart';
import '../presentation/notifications_screen/notifications_screen.dart';
import '../presentation/best_seller_one_screen/best_seller_one_screen.dart';
import '../presentation/side_menu_screen/side_menu_screen.dart';
import '../presentation/account_settings_one_screen/account_settings_one_screen.dart';
import '../presentation/profile_one_screen/profile_one_screen.dart';
import '../presentation/search_screen/search_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardOneOneScreen = '/onboard_one_one_screen';

  static const String onboardTwoScreen = '/onboard_two_screen';

  static const String onboardThreeScreen = '/onboard_three_screen';

  static const String signInOneScreen = '/sign_in_one_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String fogetPasswordOneScreen = '/foget_password_one_screen';

  static const String homeScreen = '/home_screen';

  static const String detailsOneScreen = '/details_one_screen';

  static const String favouriteOneScreen = '/favourite_one_screen';

  static const String myCartOneScreen = '/my_cart_one_screen';

  static const String checkoutThreeScreen = '/checkout_three_screen';

  static const String notificationsOneScreen = '/notifications_one_screen';

  static const String bestSellerScreen = '/best_seller_screen';

  static const String sideMenuOneScreen = '/side_menu_one_screen';

  static const String accountSettingsScreen = '/account_settings_screen';

  static const String profileScreen = '/profile_screen';

  static const String searchOneScreen = '/search_one_screen';

  static const String splashOneScreen = '/splash_one_screen';

  static const String onboardOneScreen = '/onboard_one_screen';

  static const String onboardTwoOneScreen = '/onboard_two_one_screen';

  static const String onboardThreeOneScreen = '/onboard_three_one_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpOneScreen = '/sign_up_one_screen';

  static const String fogetPasswordScreen = '/foget_password_screen';

  static const String homeTwoScreen = '/home_two_screen';

  static const String detailsScreen = '/details_screen';

  static const String favouriteScreen = '/favourite_screen';

  static const String myCartScreen = '/my_cart_screen';

  static const String checkoutTwoScreen = '/checkout_two_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String bestSellerOneScreen = '/best_seller_one_screen';

  static const String sideMenuScreen = '/side_menu_screen';

  static const String accountSettingsOneScreen = '/account_settings_one_screen';

  static const String profileOneScreen = '/profile_one_screen';

  static const String searchScreen = '/search_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        onboardOneOneScreen: OnboardOneOneScreen.builder,
        onboardTwoScreen: OnboardTwoScreen.builder,
        onboardThreeScreen: OnboardThreeScreen.builder,
        signInOneScreen: SignInOneScreen.builder,
        signUpScreen: SignUpScreen.builder,
        fogetPasswordOneScreen: FogetPasswordOneScreen.builder,
        homeScreen: HomeScreen.builder,
        detailsOneScreen: DetailsOneScreen.builder,
        favouriteOneScreen: FavouriteOneScreen.builder,
        myCartOneScreen: MyCartOneScreen.builder,
        checkoutThreeScreen: CheckoutThreeScreen.builder,
        notificationsOneScreen: NotificationsOneScreen.builder,
        bestSellerScreen: BestSellerScreen.builder,
        sideMenuOneScreen: SideMenuOneScreen.builder,
        accountSettingsScreen: AccountSettingsScreen.builder,
        profileScreen: ProfileScreen.builder,
        searchOneScreen: SearchOneScreen.builder,
        splashOneScreen: SplashOneScreen.builder,
        onboardOneScreen: OnboardOneScreen.builder,
        onboardTwoOneScreen: OnboardTwoOneScreen.builder,
        onboardThreeOneScreen: OnboardThreeOneScreen.builder,
        signInScreen: SignInScreen.builder,
        signUpOneScreen: SignUpOneScreen.builder,
        fogetPasswordScreen: FogetPasswordScreen.builder,
        homeTwoScreen: HomeTwoScreen.builder,
        detailsScreen: DetailsScreen.builder,
        favouriteScreen: FavouriteScreen.builder,
        myCartScreen: MyCartScreen.builder,
        checkoutTwoScreen: CheckoutTwoScreen.builder,
        notificationsScreen: NotificationsScreen.builder,
        bestSellerOneScreen: BestSellerOneScreen.builder,
        sideMenuScreen: SideMenuScreen.builder,
        accountSettingsOneScreen: AccountSettingsOneScreen.builder,
        profileOneScreen: ProfileOneScreen.builder,
        searchScreen: SearchScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
