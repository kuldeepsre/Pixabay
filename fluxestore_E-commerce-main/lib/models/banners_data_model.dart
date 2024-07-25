class BannersDataModel {
  final String id;
  final String title;
  final String imagePath;
  final String category;

  BannersDataModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.category,
  });

  factory BannersDataModel.fromJson(Map<String, dynamic> json) {
    return BannersDataModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'imagePath': imagePath,
      'category': category,
    };
  }
}
