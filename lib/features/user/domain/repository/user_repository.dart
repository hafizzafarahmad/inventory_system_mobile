import 'package:inventory_system/common/model/opsi_role_model.dart';
import 'package:inventory_system/features/user/domain/model/user_model.dart';
import 'package:inventory_system/features/user/domain/params/user_params.dart';

import '../../../../common/model/base_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser();
  Future<OpsiRoleModel> opsiRole();
  Future<BaseModel> postUser(SendUserParams params);
  Future<BaseModel> updateUser(SendUserParams params);
  Future<BaseModel> deleteUser(String id);
}
