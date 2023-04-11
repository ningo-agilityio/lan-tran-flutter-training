import '../api/user_api.dart';
import '../model/user.dart';

class UserController {
  Future<User?> getUser(
    String? phoneNumber,
    String? password,
  ) async {
    final users = await UserApi.getUsers();
    if (users
        .any((e) => e.phoneNumber == phoneNumber && e.password == password)) {
      final user = users
          .where((e) => e.phoneNumber == phoneNumber && e.password == password)
          .first;
      return user;
    }

    return null;
  }
}
