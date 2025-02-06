import 'package:talabat_clone/data_layer/user_model/user_entity.dart';
import 'package:talabat_clone/data_layer/user_model/user_service.dart';

class UserRepository {
  UserRepository({
    required this.userService,
  });

  final UserService userService;

  Future<UserEntity> getUser() async {
    try {
      final user = await userService.getUserApi('ash');
      return UserEntity(
          firstName: user['firstName'],
          lastName: user['lastName'],
          age: user['age']);
    } catch (error) {
      throw Exception("can't call api");
    }
  }
}
