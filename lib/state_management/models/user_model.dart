import 'package:flutter/foundation.dart';

class UserModel {
  String address;
  String password;
  UserModel({
    @required this.address,
    @required this.password,
  });

  Map<String, String> toJson() {
    return {
      "address": address,
      "password": password,
    };
  }
}
