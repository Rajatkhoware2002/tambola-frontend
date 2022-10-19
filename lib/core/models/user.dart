// import 'dart:convert';

// import 'package:flutter/cupertino.dart';

// class User extends ChangeNotifier {
//   String? language;
//   String? name;
//   String? mobile;
//   String? password;
//   String? id;
//   int activeIndex = 0;
//   int totalIndex = 2;
//   User({this.language, this.name, this.mobile, this.password, this.id});

//   Map<String, dynamic> toMap() {
//     return {
//       'username': name,
//       'mobile': mobile,
//       'password': password,
//       "_id": id
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//         name: map['username'] ?? '',
//         mobile: map['mobile'] ?? '',
//         password: map['password'],
//         id: map["_id"]);
//   }

//   String toJson() => json.encode(toMap());
//   factory User.fromJson(String source) => User.fromMap(json.decode(source));
// }
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User  extends ChangeNotifier{
    User({
       required this.user,
       required this.token,
    });

    UserClass user;
    String token;

    factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class UserClass {
    UserClass({
        this.id,
        this.username,
        this.password,
        this.isAdmin,
        this.mobile,
        this.agreePrivacyPolicy,
        this.language,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String ?id;
    String ?username;
    String ?password;
    bool? isAdmin;
    int ?mobile;
    bool? agreePrivacyPolicy;
    String? language;
    bool ?isActive;
    DateTime? createdAt;
    DateTime ?updatedAt;
    int ?v;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["_id"],
        username: json["username"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        mobile: json["mobile"],
        agreePrivacyPolicy: json["AgreePrivacyPolicy"],
        language: json["language"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "password": password,
        "isAdmin": isAdmin,
        "mobile": mobile,
        "AgreePrivacyPolicy": agreePrivacyPolicy,
        "language": language,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
