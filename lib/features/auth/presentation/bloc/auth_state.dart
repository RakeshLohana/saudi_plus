import 'package:equatable/equatable.dart';
import 'package:saudi_plus/features/auth/domain/data/models/LoginResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterResponseModel.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}


///Login State
class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final LoginResponseModel loginResponse;  // Store the login response

  const LoginSuccess({required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];  // Include the login response in props
}

class LoginFailure extends AuthState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}





///Register State
class RegisterInitial extends AuthState {}

class  RegisterLoading extends AuthState {}

class  RegisterSuccess extends AuthState {
  final RegisterResponseModel registerResponseModel;  // Store the login response

  const RegisterSuccess({required this.registerResponseModel});

  @override
  List<Object> get props => [registerResponseModel];  // Include the login response in props
}

class  RegisterFailure extends AuthState {
  final String error;

  const RegisterFailure(this.error);

  @override
  List<Object> get props => [error];
}
