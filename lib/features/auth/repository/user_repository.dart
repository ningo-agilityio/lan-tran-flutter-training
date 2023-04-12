import '../api/user_api.dart';
import '../model/user.dart';

class UserRepository {
  Future<List<User>> getUser() async {
    List<User> users = [];

    try {
      users = await UserApi.getUsers();
    } catch (e) {}

    return users;
  }
}
