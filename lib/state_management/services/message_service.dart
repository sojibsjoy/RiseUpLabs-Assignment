import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mail_tm/constants/constants.dart';
import 'package:mail_tm/state_management/models/message_model.dart';

class MessageService {
  static var client = http.Client();

  static Future<List<HydraMember>> getMessages(String token) async {
    MessageModel msgModel = MessageModel();
    var response = await client.get(
      Uri.parse(Constants.API + '/messages/'),
      headers: {
        'Content-Type': 'application/ld+json',
        'Accept': 'application/ld+json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      msgModel = messageModelFromJson(jsonString);
      return msgModel.hydraMember;
    } else {
      msgModel = messageModelFromJson("");
      return msgModel.hydraMember;
    }
  }
}
