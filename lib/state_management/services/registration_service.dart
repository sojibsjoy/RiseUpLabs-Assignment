import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mail_tm/constants/constants.dart';
import 'package:mail_tm/state_management/models/user_model.dart';

class RegistrationService {
  static Future<void> createAccount(UserModel item) async {
    var response = await http.post(
      Uri.parse(Constants.API + '/accounts'),
      headers: Constants.headers,
      body: json.encode(item.toJson()),
    );
    if (response.statusCode == 201) {
      print("Account Created!");
    } else {
      print("Failed to craete an account!");
      print(response.statusCode.toString());
    }
  }
}
