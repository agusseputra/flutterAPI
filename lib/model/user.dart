// To parse this JSON data, do
//
//     final responUser = responUserFromJson(jsonString);

import 'dart:convert';

ResponUser responUserFromJson(String str) => ResponUser.fromJson(json.decode(str));

String responUserToJson(ResponUser data) => json.encode(data.toJson());

class ResponUser {
    ResponUser({
        this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data
    });

    int page;
    int perPage;
    int total;
    int totalPages;
    List<User> data;

    factory ResponUser.fromJson(Map<String, dynamic> json) => ResponUser(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<User>.from(json["data"].map((x) => User.fromJson(x)))
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class User {
    User({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatar,
        this.gender,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;
    String gender;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "gender": gender,
    };
}