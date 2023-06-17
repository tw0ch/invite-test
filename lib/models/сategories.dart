// To parse this JSON data, do
//
// final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
    List<Category> categories;

    Categories({
        required this.categories,
    });

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<Category>.from(json["сategories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "сategories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String name;
    String imageUrl;

    Category({
        required this.id,
        required this.name,
        required this.imageUrl,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
    };
}
