// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

List<Photo> photoFromJson(String str) => List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));

String photoToJson(List<Photo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photo {
    final int id;
    final String description;
    final String urlImage;
    final double latitude;
    final double longitude;
    final String city;
    final dynamic usersId;

    Photo({
        required this.id,
        required this.description,
        required this.urlImage,
        required this.latitude,
        required this.longitude,
        required this.city,
        required this.usersId,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        description: json["description"],
        urlImage: json["url_image"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        city: json["city"],
        usersId: json["usersId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "url_image": urlImage,
        "latitude": latitude,
        "longitude": longitude,
        "city": city,
        "usersId": usersId,
    };
}