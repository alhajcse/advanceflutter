
import 'dart:async';
import 'package:flutter_app/model/user_info.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MyApiProvider {
  Client client = Client();

  Future<UserInfo> fetchUserList() async {

    print("entered");

    final response = await client
        .get("http://dummy.restapiexample.com/api/v1/employees");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return UserInfo.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}