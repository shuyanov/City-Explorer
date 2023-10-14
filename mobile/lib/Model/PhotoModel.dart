// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());

class Photo {
    final int id;
    final String description;
    final String urlImage;
    final double latitude;
    final double longitude;
    final String city;
    final Users users;

    Photo({
        required this.id,
        required this.description,
        required this.urlImage,
        required this.latitude,
        required this.longitude,
        required this.city,
        required this.users,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        description: json["description"],
        urlImage: json["url_image"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        city: json["city"],
        users: Users.fromJson(json["Users"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "url_image": urlImage,
        "latitude": latitude,
        "longitude": longitude,
        "city": city,
        "Users": users.toJson(),
    };
}

class Users {
    final int id;
    final List<UserPhoto> userPhotos;
    final List<UserAchievement> userAchievements;

    Users({
        required this.id,
        required this.userPhotos,
        required this.userAchievements,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        userPhotos: List<UserPhoto>.from(json["user_photos"].map((x) => UserPhoto.fromJson(x))),
        userAchievements: List<UserAchievement>.from(json["user_achievements"].map((x) => UserAchievement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_photos": List<dynamic>.from(userPhotos.map((x) => x.toJson())),
        "user_achievements": List<dynamic>.from(userAchievements.map((x) => x.toJson())),
    };
}

class UserAchievement {
    final int achievementId;
    final String name;

    UserAchievement({
        required this.achievementId,
        required this.name,
    });

    factory UserAchievement.fromJson(Map<String, dynamic> json) => UserAchievement(
        achievementId: json["achievement_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "achievement_id": achievementId,
        "name": name,
    };
}

class UserPhoto {
    final int photoId;
    final String url;

    UserPhoto({
        required this.photoId,
        required this.url,
    });

    factory UserPhoto.fromJson(Map<String, dynamic> json) => UserPhoto(
        photoId: json["photo_id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "photo_id": photoId,
        "url": url,
    };
}
