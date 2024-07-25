import '../../../core/app_export.dart';/// This class is used in the [bestseller_item_widget] screen.
class BestsellerItemModel {BestsellerItemModel({this.bestSeller, this.bestSeller1, this.nikeAirForce, this.menSShoes, this.price, this.image, this.id, }) { bestSeller = bestSeller  ?? ImageConstant.img81a48fdfedf49d083x125;bestSeller1 = bestSeller1  ?? "Best Seller";nikeAirForce = nikeAirForce  ?? "Nike Air Force";menSShoes = menSShoes  ?? "Men’s Shoes";price = price  ?? "367.76";image = image  ?? ImageConstant.imgCloseBlue200;id = id  ?? ""; }

String? bestSeller;

String? bestSeller1;

String? nikeAirForce;

String? menSShoes;

String? price;

String? image;

String? id;

 }
