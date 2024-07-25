import '../../../core/app_export.dart';/// This class is used in the [favourite_item_widget] screen.
class FavouriteItemModel {FavouriteItemModel({this.bestSeller, this.favorite, this.bestSeller1, this.nikeJordan, this.price, this.image, this.id, }) { bestSeller = bestSeller  ?? ImageConstant.imgPngitem555064281x125;favorite = favorite  ?? ImageConstant.imgFavoriteRed300;bestSeller1 = bestSeller1  ?? "Best Seller";nikeJordan = nikeJordan  ?? "Nike Jordan";price = price  ?? "58.7";image = image  ?? ImageConstant.imgUserTeal200;id = id  ?? ""; }

String? bestSeller;

String? favorite;

String? bestSeller1;

String? nikeJordan;

String? price;

String? image;

String? id;

 }
