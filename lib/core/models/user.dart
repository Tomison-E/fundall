import 'package:flutter/material.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;
  final int monthlyTarget;

  User({
    @required this.id,
    @required this.email,
    @required this.firstName,
    this.lastName,
    this.avatar,
    this.monthlyTarget,
  }):assert(id!=null),assert(email!=null),assert(avatar!=null),assert(firstName!=null);

  User.fromMap(Map<dynamic, dynamic> map)
      : id = map["id"] as int,
        firstName = map["firstname"],
        lastName = map["lastname"],
        email = map["email"],
        avatar= map["avatar"],
        monthlyTarget= map["monthly_target"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["firstname"] = firstName;
    data["lastname"] = lastName;
    data["email"] = email;
    data["avatar"] = avatar;
    data["monthly_target"] = monthlyTarget;

    return data;
  }


}