import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mail_tm/constants/constants.dart';
import 'package:mail_tm/state_management/models/domain_model.dart';

class DomainService {
  static var client = http.Client();
  

  static Future<List<HydraMember>> getDomains() async {
    Domain newObject = Domain();
    var response = await client.get(
      Uri.parse(Constants.API + '/domains/'),
      headers: Constants.queries,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;

      newObject = domainFromJson(jsonString);
      return newObject.hydraMember;
    } else {
      newObject = domainFromJson("null");
      return newObject.hydraMember;
    }
  }
}
