import 'package:talabat_clone/data_layer/user_model/user_entity.dart';

class UserService {
  Future<Map<String, dynamic>> getUserApi(String name) async {
    await Future.delayed(Duration(seconds: 1));
    return UserEntity(firstName: 'ash', lastName: 'hassan', age: 18).toJson();
  }
}
