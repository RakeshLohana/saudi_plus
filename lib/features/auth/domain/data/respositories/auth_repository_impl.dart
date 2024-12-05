import 'package:saudi_plus/core/error/exceptions.dart';
import 'package:saudi_plus/features/auth/domain/data/datasources/auth_data_source.dart';
import 'package:saudi_plus/features/auth/domain/data/models/LoginResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/UserModel.dart';
import 'package:saudi_plus/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginResponseModel?> login(String email, String password) async {
    try {
      return await remoteDataSource.login(email, password);
    } on ServerException catch (e) {
      throw Exception( e);
    }
  }

  @override
  Future<RegisterResponseModel?> register(RegisterModel register) async {
    try {
      return await remoteDataSource.register(register);
    } on ServerException catch (e) {
      throw Exception( e);
    }
  }
}
