import 'package:equatable/equatable.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterModel.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends AuthEvent {
  final String username;
  final String password;

  const LoginButtonPressed({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}


class RegisterButtonPressed extends AuthEvent {
  final RegisterModel register;

  const RegisterButtonPressed({required this.register});

  @override
  List<Object> get props => [register];
}