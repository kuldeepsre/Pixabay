class ProductReviewModel {
  String? name;
  String? profileImage;
  int? stars;
  String? description;
  String? date;
  List<String>? productImages;

  ProductReviewModel(
      {this.name,
      this.profileImage,
      this.stars,
      this.description,
      this.date,
      this.productImages});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImage = json['profileImage'];
    stars = json['stars'];
    description = json['description'];
    date = json['date'];
    productImages = json['productImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profileImage'] = profileImage;
    data['stars'] = stars;
    data['description'] = description;
    data['date'] = date;
    data['productImages'] = productImages;
    return data;
  }
}
