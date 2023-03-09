import 'package:inventory_system/features/auth/data/model/login_model.dart';
import 'package:inventory_system/features/auth/domain/params/login_params.dart';

abstract class AuthRepository {
  Future<UserLoginModel> login(LoginParams params);
}
