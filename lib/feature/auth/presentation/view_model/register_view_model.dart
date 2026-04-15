import 'package:dio/dio.dart';
import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/domain/entities/request/auth/register_request.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/feature/auth/presentation/view_model/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase) : super(AuthLoadingState());

  Future<void> register(
    String password,
    String email,
    String rePassword,
    String phone,
    String name,
  ) async {
    try {
      emit(AuthLoadingState());
      RegisterRequest registerRequest = RegisterRequest(
        password: password,
        email: email,
        rePassword: rePassword,
        phone: phone,
        name: name,
      );
      var authResponse = await _registerUseCase.call(registerRequest);
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
      emit(
        AuthErrorState(
          errorMessage: UnExpectedException(message: e.toString()),
        ),
      );
    }
  }
}
