import 'package:saudi_plus/core/network/api_client.dart';
import 'package:saudi_plus/core/network/api_constants.dart';
import 'package:saudi_plus/core/utils/general.dart';
import 'package:saudi_plus/features/auth/domain/data/models/LoginResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterResponseModel.dart';
import 'package:saudi_plus/features/auth/domain/data/models/UserModel.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource(this.apiClient);

  Future<LoginResponseModel?> login(String email, String password) async {
    final response = await apiClient.post(
      ApiConstants.login,

      data: {"email": email, "password": password},
    );
    return LoginResponseModel.fromJson(response.data);
  }

  Future<RegisterResponseModel?> register(RegisterModel register) async {
    try{
      final response = await apiClient.post(
        ApiConstants.createIndividualUser,

        data: register.toJson(),
      );
      return RegisterResponseModel.fromJson(response.data);
    }catch(e){
      printLog(e);
    }

  }
}
