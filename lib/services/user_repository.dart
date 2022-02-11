import 'package:http_test_flutter/services/user_api_provider.dart';

import '../model/user.dart';

class UserRepository{
  UserProvider _usersPorvider  = UserProvider();

  Future<List<User>> getAllUsers() => _usersPorvider.getUser();

}