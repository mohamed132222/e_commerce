import 'package:e_commerce/domain/entities/request/auth/login_request.dart';
import 'package:e_commerce/domain/entities/request/auth/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);
}
