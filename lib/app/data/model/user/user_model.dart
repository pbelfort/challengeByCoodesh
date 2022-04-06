import 'dart:convert';

import 'package:pharma/app/data/model/user/dob_model.dart';
import 'package:pharma/app/data/model/user/location_model.dart';
import 'package:pharma/app/data/model/user/login_model.dart';
import 'package:pharma/app/data/model/user/name_model.dart';
import 'package:pharma/app/data/model/user/picture_model.dart';

UserModel userModelFromJson(str) => UserModel.fromJson(str);

List<UserModel> listUserModelFromJson(str) =>
    List<UserModel>.from(str.map((x) => UserModel.fromJson(x)));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {this.name,
      this.dob,
      this.email,
      this.phone,
      this.cell,
      this.picture,
      this.location,
      this.gender,
      this.nationality,
      this.login});

  Name? name;
  Dob? dob;
  String? email;
  String? phone;
  String? cell;
  Picture? picture;
  Location? location;
  String? gender;
  String? nationality;
  Login? login;

  UserModel copyWith(
      {String? userId,
      String? username,
      Dob? dob,
      String? email,
      String? phone,
      String? cell,
      Picture? picture,
      String? cepCustom,
      Location? location,
      String? gender,
      String? nationality,
      Login? login}) {
    return UserModel(
      name: name ?? name,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cell: cell ?? this.cell,
      picture: picture ?? this.picture,
      location: location ?? this.location,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
      login: login ?? this.login,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: Name.fromJson(json["name"]),
        dob: Dob.fromJson(json["dob"]),
        email: json["email"],
        phone: json["phone"],
        cell: json["cell"],
        picture: Picture.fromJson(json["picture"]),
        location: Location.fromJson(json["location"]),
        gender: json["gender"],
        nationality: json["nationality"],
        login: Login.fromJson(json["login"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dob": dob,
        "email": email,
        "phone": phone,
        "cell": cell,
        "picture": picture,
        "location": location,
        "gender": gender,
        "nationality": nationality,
        "login": login,
      };
}
