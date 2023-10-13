// To parse this JSON data, do
//
//     final achievements = achievementsFromJson(jsonString);

import 'dart:convert';

List<Achievements> achievementsFromJson(String str) => List<Achievements>.from(json.decode(str).map((x) => Achievements.fromJson(x)));

String achievementsToJson(List<Achievements> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Achievements {
    final int id;
    final String name;
    final String description;

    Achievements({
        required this.id,
        required this.name,
        required this.description,
    });

    factory Achievements.fromJson(Map<String, dynamic> json) => Achievements(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}
