import '../api/user_api.dart';
import '../model/user.dart';

class UserRepository {
  Future<List<User>> load() async {
    final users = await UserApi.getUsers();

    return users;
  }
}
