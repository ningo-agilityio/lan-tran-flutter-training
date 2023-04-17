import '../api/user_api.dart';
import '../model/user.dart';

class UserRepository {
  Future<List<User>> getUser() async {
    final users = await UserApi.getUsers();

    return users;
  }
}
