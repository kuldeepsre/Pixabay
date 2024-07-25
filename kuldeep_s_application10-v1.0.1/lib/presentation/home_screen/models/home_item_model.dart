import '../../../core/app_export.dart';/// This class is used in the [home_item_widget] screen.
class HomeItemModel {HomeItemModel({this.bestSeller, this.bestSeller1, this.nikeJordan, this.price, this.id, }) { bestSeller = bestSeller  ?? ImageConstant.imgPngitem5550642;bestSeller1 = bestSeller1  ?? "Best Seller";nikeJordan = nikeJordan  ?? "Nike Jordan";price = price  ?? "493.00";id = id  ?? ""; }

String? bestSeller;

String? bestSeller1;

String? nikeJordan;

String? price;

String? id;

 }
