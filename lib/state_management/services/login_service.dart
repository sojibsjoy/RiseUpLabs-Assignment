import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mail_tm/constants/constants.dart';
import 'package:mail_tm/state_management/models/login_model.dart';
import 'package:mail_tm/state_management/models/user_model.dart';

class LoginService {
  static Future<String> login(UserModel item) async {
    LoginModel newObject = LoginModel();
    var response = await http.post(
      Uri.parse(Constants.API + '/token'),
      headers: Constants.headers,
      body: json.encode(
        item.toJson(),
      ),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      newObject = loginModelFromJson(jsonString);
      return newObject.token;
    } else {
      return "";
    }
  }
}
