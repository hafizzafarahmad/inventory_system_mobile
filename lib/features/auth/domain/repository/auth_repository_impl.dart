import 'package:inventory_system/features/auth/data/model/login_model.dart';

import '../../data/datasource/auth_remote_data_source.dart';
import '../params/login_params.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(
      {required this.authRemoteDataSource});

  @override
  Future<UserLoginModel> login(LoginParams params) {
    try {
      return authRemoteDataSource.postLogin(params: params);
    } catch (e) {
      throw e.toString();
    }
  }

  
}