import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/auth/auth_response_mapper.dart';
import 'package:e_commerce/api/mapper/auth/login_requset_mapper.dart';
import 'package:e_commerce/core/cahce/shared_pref_utils.dart';
import 'package:e_commerce/data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:e_commerce/domain/entities/request/auth/login_request.dart';
import 'package:e_commerce/domain/entities/request/auth/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';
import 'package:injectable/injectable.dart';

import '../../../mapper/auth/register_request_mapper.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  //todo AuthResponseDto=>AuthResponse
  //todo loginRequest=>LoginRequestDto
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    var authResponse = await _apiServices.login(
      loginRequest.toLoginRequestDto(),
    );
    //todo set Token
    SharedPrefUtils.writeDate(key: "token", value: authResponse.token ?? "");
    return authResponse.toAuthResponse();
  }

  //todo AuthResponseDto=>AuthResponse
  // todo RegisterRequest=>RegisterRequestDto
  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    var authResponse = await _apiServices.register(
      registerRequest.toRegisterRequestDto(),
    );
    return authResponse.toAuthResponse();
  }
}

//todo view=>viewModel
//todo viewModel=>useCase
//todo useCase=>repository
//todo repository=>dataSource
//todo dataSource=>ApiServices
