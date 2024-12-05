import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_plus/core/network/api_client.dart';
import 'package:saudi_plus/features/auth/domain/data/datasources/auth_data_source.dart';
import 'package:saudi_plus/features/auth/domain/data/models/LoginResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/respositories/auth_repository_impl.dart';
import 'package:saudi_plus/features/auth/domain/repository/auth_repository.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_event.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    final ApiClient apiClient = ApiClient(language: 'ar',dio: Dio());


    final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource(apiClient);

    final AuthRepository authRepository = AuthRepositoryImpl(authRemoteDataSource);

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        LoginResponseModel? loginResponse = await authRepository.login(
            event.username,
            event.password
        );

        if (loginResponse != null && (loginResponse.payload?.accessToken?.isNotEmpty??false)) {
          emit(LoginSuccess(loginResponse: loginResponse));
        } else {
          emit(const LoginFailure('Invalid username or password'));
        }
      } catch (e) {
        emit(const LoginFailure('An error occurred during login'));
      }
    });



    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());

      try {
        RegisterResponseModel? registerResponseModel = await authRepository.register(
          event.register
        );

        if (registerResponseModel !=null) {
          emit(RegisterSuccess( registerResponseModel: registerResponseModel));
        } else {
          emit( RegisterFailure('${registerResponseModel?.message}'));
        }
      } catch (e) {
        emit(const RegisterFailure('An error occurred during login'));
      }
    });
  }
}
