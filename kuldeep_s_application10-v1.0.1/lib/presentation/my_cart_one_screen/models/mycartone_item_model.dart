import '../../../core/app_export.dart';/// This class is used in the [mycartone_item_widget] screen.
class MycartoneItemModel {MycartoneItemModel({this.nikeClubMax, this.nikeClubMax1, this.price, this.l, this.one, this.image, this.id, }) { nikeClubMax = nikeClubMax  ?? ImageConstant.imgNikeEpicReact;nikeClubMax1 = nikeClubMax1  ?? "Nike Club Max";price = price  ?? "64.95";l = l  ?? "L";one = one  ?? "1";image = image  ?? ImageConstant.imgDeleteIcon;id = id  ?? ""; }

String? nikeClubMax;

String? nikeClubMax1;

String? price;

String? l;

String? one;

String? image;

String? id;

 }
