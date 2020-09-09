
import 'dart:async';

import 'package:flutter_app/model/user_info.dart';
import 'package:flutter_app/repository/network_provider.dart';

class Repository {
  final myApiProvider = MyApiProvider();
  Future<UserInfo> fetchAllInformation() => myApiProvider.fetchUserList();
}