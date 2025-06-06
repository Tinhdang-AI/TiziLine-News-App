import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categoryList = [];

  categoryList.add(CategoryModel(
    categoryName: "Business",
    image: "images/business.jpg",
  ));

  categoryList.add(CategoryModel(
    categoryName: "Entertainment",
    image: "images/entertainment.jpg",
  ));

  categoryList.add(CategoryModel(
    categoryName: "Science",
    image: "images/science.jpg",
  ));

  categoryList.add(CategoryModel(
    categoryName: "Sports",
    image: "images/sports.jpg",
  ));

  categoryList.add(CategoryModel(
    categoryName: "Technology",
    image: "images/technology.jpg",
  ));

  return categoryList;
}
