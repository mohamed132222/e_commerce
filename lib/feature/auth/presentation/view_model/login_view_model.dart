import 'package:dio/dio.dart';
import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/domain/entities/request/auth/login_request.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/feature/auth/presentation/view_model/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase) : super(AuthLoadingState());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      LoginRequest loginRequest = LoginRequest(
        email: email,
        password: password,
      );
      var authResponse = await _loginUseCase.call(loginRequest);
      emit(AuthSuccessState(authResponse: authResponse));
    } on DioException catch (e) {
      String message = (e.error is AppException)
          ? (e.error as AppException).message
          : "some thing went wrong";
      emit(AuthErrorState(errorMessage: ServerException(message: message)));
    } on AppException catch (e) {
      String message = e.message;
      emit(AuthErrorState(errorMessage: UnExpectedException(message: message)));
    } catch (e) {
      emit(AuthErrorState(errorMessage: AppException(message: e.toString())));
    }
  }
}
