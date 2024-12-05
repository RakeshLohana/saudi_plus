import 'package:saudi_plus/features/auth/domain/data/models/LoginResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/UserModel.dart';

abstract class AuthRepository {
  Future<LoginResponseModel?> login(String email, String password);
  Future<RegisterResponseModel?> register(RegisterModel register);
}
