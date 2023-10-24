import 'dart:convert';

class ToolsItem {
  ToolsItem(
      {required this.available,
      required this.name,
      this.picture,
      required this.price,
      this.id});

  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  factory ToolsItem.fromJson(String str) => ToolsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ToolsItem.fromMap(Map<String, dynamic> json) => ToolsItem(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  ToolsItem copy() => ToolsItem(
        available: this.available,
        name: this.name,
        picture: this.picture,
        price: this.price,
        id: this.id,
      );
}
