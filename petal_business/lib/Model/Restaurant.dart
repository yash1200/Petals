import 'dart:convert';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

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

  Map<String, dynamic> toJson() => {
        "_id": id,
        "owner": owner,
        "ownerId": ownerId,
        "name": name,
        "phone": phone,
        "email": email,
        "menus": List<dynamic>.from(menus!.map((x) => x.toJson())),
        "__v": v,
      };
}

class Menu {
  Menu({
    this.items,
    this.type,
  });

  List<Item>? items;
  String? type;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        type: json["type"],
      );

  Map<String, dynamic>? toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "type": type,
      };
}

class Item {
  Item({
    this.name,
    this.price,
  });

  String? name;
  int? price;

  factory Item.fromJson(Map<String, dynamic>? json) => Item(
        name: json?["name"] ?? "",
        price: json?["price"] ?? "",
      );

  Map<String, dynamic>? toJson() => {
        "name": name,
        "price": price,
      };
}
