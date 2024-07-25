class ProductDataModel {
  String? id;
  String? productName;
  String? imageUrl;
  double? price;
  String? descriptionn;
  int? ratings;
  List<String>? sizes;
  List? colors;
  bool? favorite;

  ProductDataModel(
      {this.id,
      this.productName,
      this.imageUrl,
      this.price,
      this.descriptionn,
      this.ratings,
      this.colors,
      this.favorite,
      this.sizes});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    productName = json['productName'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    descriptionn = json['description'];
    ratings = json['ratings'];
    sizes = json['sizes'].cast<String>();
    colors = json['colors'].cast();
    favorite =json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['imageUrl'] = imageUrl;
    data['price'] = price;
    data['descriptionn'] = descriptionn;
    data['ratings'] = ratings;
    data['sizes'] = sizes;
    data['colors'] = colors;
    data['favorite'] = favorite;
    return data;
  }
}
