// To parse this JSON data, do
//
// final dishes = dishesFromJson(jsonString);

import 'dart:convert';

Dishes dishesFromJson(String str) => Dishes.fromJson(json.decode(str));

String dishesToJson(Dishes data) => json.encode(data.toJson());

class Dishes {
  List<Dish> dishes;
  static final Set<String> allTags = {};

  Dishes({
    required this.dishes,
  });

  factory Dishes.fromJson(Map<String, dynamic> json) => Dishes(
        dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dishes": List<dynamic>.from(dishes.map((x) => x.toJson())),
      };
}

class Dish {
  int id;
  String name;
  int price;
  int weight;
  String description;
  String imageUrl;
  List<String> tags;

  Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.imageUrl,
    required this.tags,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        weight: json["weight"],
        description: json["description"],
        imageUrl: json["image_url"],
        tags: List<String>.from(
          json["tegs"].map((x) {
            Dishes.allTags.add(x.toString());
            return x.toString();
          }),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "weight": weight,
        "description": description,
        "image_url": imageUrl,
        "tags": List<String>.from(
          tags.map((x) => x),
        ),
      };
}
