import 'package:e_commerce/api/model/request/auth/register/register_request_dto.dart';
import 'package:e_commerce/domain/entities/request/auth/register_request.dart';

//todo RegisterRequest=>RegisterRequestDto
extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto toRegisterRequestDto() {
    return RegisterRequestDto(
      password: password,
      email: email,
      name: name,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
