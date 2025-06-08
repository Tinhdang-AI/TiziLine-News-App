

// class CategoryModel {
//   String? categoryName;
//   String? image;

//   CategoryModel({required this.categoryName, required this.image});
// }

class CategoryModel {
  final String categoryName;
  final String image;

  CategoryModel({
    required this.categoryName,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json['categoryName'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'image': image,
    };
  }
}
