// مقفوله يعني معرفش اعمل object منه الا عن طريق child بتوعه
import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';

sealed class AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthErrorState extends AuthStates {
  AppException errorMessage;

  AuthErrorState({required this.errorMessage});
}

class AuthSuccessState extends AuthStates {
  AuthResponse authResponse;

  AuthSuccessState({required this.authResponse});
}
