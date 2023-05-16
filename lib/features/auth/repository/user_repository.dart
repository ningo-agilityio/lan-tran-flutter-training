import '../../../core/storage/user_storage.dart';
import '../model/user.dart';

class UserRepository {
  Future<List<User>> load() async {
    await UserStorage.setUsers();
    final users = await UserStorage.getUsers();
    return users;
  }
}
