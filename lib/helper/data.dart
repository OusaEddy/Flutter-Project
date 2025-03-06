import 'package:flutter_news/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> categories = [];
  CategoryModel categoryModel = CategoryModel(categoryName: '', imageUrl: '');

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1664575600796-ffa828c5cb6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  categories.add(categoryModel);

  categoryModel = CategoryModel(categoryName: '', imageUrl: '');

  //2
  categoryModel = CategoryModel(
    categoryName: "Entertainment",
    imageUrl: "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  );
  categories.add(categoryModel);

  //3
  categoryModel = CategoryModel(
    categoryName: "General",
    imageUrl: "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
  );
  categories.add(categoryModel);

  //4
  categoryModel = CategoryModel(
    categoryName: "Health",
    imageUrl: "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"
  );
  categories.add(categoryModel);

  //5
  categoryModel = CategoryModel(
    categoryName: "Sports",
    imageUrl: "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
  );
  categories.add(categoryModel);

  //7
  categoryModel = CategoryModel(
    categoryName: "Technology",
    imageUrl: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  );
  categories.add(categoryModel);

  return categories;
}
