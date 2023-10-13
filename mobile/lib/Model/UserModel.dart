// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    final int id;
    final List<UserPhoto> userPhotos;
    final List<UserAchievement> userAchievements;

    User({
        required this.id,
        required this.userPhotos,
        required this.userAchievements,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
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
