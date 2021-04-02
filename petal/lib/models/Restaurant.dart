import 'dart:convert';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

class Restaurant {
  Restaurant({
    this.id,
    this.owner,
    this.ownerId,
    this.name,
    this.phone,
    this.email,
    this.menus,
    this.v,
  });

  String? id;
  String? owner;
  String? ownerId;
  String? name;
  String? phone;
  String? email;
  List<Menu>? menus;
  int? v;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        owner: json["owner"],
        ownerId: json["ownerId"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
        v: json["__v"],
      );
}

class Menu {
  Menu({
    this.items,
    this.id,
    this.type,
  });

  List<Item>? items;
  String? id;
  String? type;

  factory Menu.fromJson(Map<String, dynamic> json) =>
      Menu(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        id: json["_id"],
        type: json["type"],
      );
}

class Item {
  Item({
    this.id,
    this.name,
    this.price,
  });

  String? id;
  String? name;
  int? price;

  factory Item.fromJson(Map<String, dynamic>? json) =>
      Item(
        id: json?["_id"] ?? "",
        name: json?["name"] ?? "",
        price: json?["price"] ?? 0,
      );
}
