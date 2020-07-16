import 'dart:convert';

List<Searchres> searchresFromJson(String str) =>
    List<Searchres>.from(json.decode(str).map((x) => Searchres.fromJson(x)));

String searchresToJson(List<Searchres> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Searchres {
  Searchres({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Searchres.fromJson(Map<String, dynamic> json) => Searchres(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
