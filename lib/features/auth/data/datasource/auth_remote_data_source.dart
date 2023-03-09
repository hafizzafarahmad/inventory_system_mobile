import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inventory_system/core/network/api_endpoint.dart';
import 'package:inventory_system/core/network/app_network.dart';
import 'package:inventory_system/features/auth/data/model/login_model.dart';
import '../../domain/params/login_params.dart';

class AuthRemoteDataSource {
  final storage = const FlutterSecureStorage();

  Future<UserLoginModel> postLogin({
    required LoginParams params,
  }) async {
    try {

      final res = await AppNetworkClient.post(path: ApiEndPoint.login,
        customHeader: {
          'Content-Type' : 'application/json',
          'Accept' : 'application/json'
        },
        jsonMap: {
          "email": params.username,
          "password": params.password
        },
      );
      return UserLoginModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

}