import 'package:e_commerce/domain/entities/response/auth/user.dart';

import '../../model/response/auth/user_dto.dart';

//todo UserDto=>User
extension UserMapper on UserDto {
  User toUser() {
    return User(email: email, name: name, role: role);
  }
}
