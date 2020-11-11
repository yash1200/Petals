import 'dart:convert';

List<Recent> recentFromJson(String str) =>
    List<Recent>.from(json.decode(str).map((x) => Recent.fromJson(x)));

String recentToJson(List<Recent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recent {
  Recent({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Recent.fromJson(Map<String, dynamic> json) => Recent(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
