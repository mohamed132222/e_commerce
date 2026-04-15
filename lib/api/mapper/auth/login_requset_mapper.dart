import 'package:e_commerce/api/model/request/auth/login/login_request_dto.dart';
import 'package:e_commerce/domain/entities/request/auth/login_request.dart';

extension LoginRequsetMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
