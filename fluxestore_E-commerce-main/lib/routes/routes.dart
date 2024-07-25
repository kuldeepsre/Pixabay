import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/models/banners_data_model.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/presentation/authentication/authentication_page.dart';
import 'package:fluxestore/presentation/authentication/bloc/auth_page_bloc.dart';
import 'package:fluxestore/presentation/landing_page/landing_page.dart';
import 'package:fluxestore/presentation/pages/Onbording_page/onbording_page.dart';
import 'package:fluxestore/presentation/pages/OrderDetails/order_details_page.dart';
import 'package:fluxestore/presentation/pages/checkout/checkout_main.view.dart';
import 'package:fluxestore/presentation/pages/collections_page.dart';
import 'package:fluxestore/presentation/pages/notification_page.dart';
import 'package:fluxestore/presentation/pages/product_feedback_page.dart';
import 'package:fluxestore/presentation/pages/settings_page.dart';
import 'package:fluxestore/presentation/pages/wish_list_page/wish_list_page.dart';
import 'package:fluxestore/routes/custom_transition_routes.dart';
import '../models/product_data_model.dart';
import '../presentation/landing_page/bloc/landing_page_bloc.dart';
import '../presentation/pages/MyOrders/my_orders_page.dart';
import '../presentation/pages/checkout/bloc/check_out_page_bloc.dart';
import '../presentation/pages/product_details_page/product_details_page.dart';
import '../presentation/pages/products_page/products_page.dart';

class MyGenerateRoute {
  final AuthPageBloc authPagebloc = AuthPageBloc();
  final LandingPageBloc landingPageBloc = LandingPageBloc();
  final CheckOutPageBloc checkOutPageBloc = CheckOutPageBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Authentication':
        return CustomPageTransition(
            child: const AuthenticationPage(),
            dx: 1.0,
            dy: 0.0,
            curves: Curves.easeInOutCirc);

      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthPageBloc>.value(
            value: authPagebloc,
            child:  LandingPage(
              token: authPagebloc.rawToken,
            ),
          ),
        );
      case "onBording":
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case 'notifications':
        return CustomPageTransition(
            child: const NotificationPage(),
            dx: 1.0,
            dy: 0.0,
            curves: Curves.easeInOutCirc);

      case 'viewCollections':
        final BannersDataModel data = settings.arguments as BannersDataModel;
        return CustomPageTransition(
            dx: 0.0,
            dy: 1.0,
            curves: Curves.easeInOutCirc,
            child: CollectionsPage(
              bannerData: data,
            ));

      case 'productDetails':
        final ProductDataModel productData =
            settings.arguments as ProductDataModel;
        return CustomPageTransition(
            //for bottom up transition
            dx: 0.0,
            dy: 1.0,
            curves: Curves.easeInOutCirc,
            child: ProductDetailsPage(
              // currentUserId: userId,
              data: productData,
            ));

      case 'productsPage':
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: const ProductsPage());  

      case 'MyOrders':
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: const MyOrdersPage());

      case 'settings':
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: const SettingsPage());

      case "checkOut":
        final MyOrdersDataModel myordersData =
            settings.arguments as MyOrdersDataModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CheckOutPageBloc>.value(
            value: checkOutPageBloc,
            child: CheckOutPage(
              myOrdersData: myordersData,
            ),
          ),
        );

      case 'orderDetailsPage':
        final Map<String, dynamic> args =
            settings.arguments as Map<String, dynamic>;
        final MyOrdersDataModel myordersData =
            args['myordersData'] as MyOrdersDataModel;
        final dynamic status = args['status'];
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: OrderDetailsPage(
              data: myordersData,
              status: status,
            ));

      case 'WishListPage':
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: const WishListPage());

      case 'productFeedbackPage':
        return CustomPageTransition(
            //for bottom up transition
            dx: 0.0,
            dy: 1.0,
            curves: Curves.fastOutSlowIn,
            child: const ProductFeedBackPage());
            
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
