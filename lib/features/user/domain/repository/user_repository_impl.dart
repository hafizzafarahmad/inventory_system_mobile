
import 'package:inventory_system/common/data/common_remote_data_source.dart';
import 'package:inventory_system/common/model/base_model.dart';
import 'package:inventory_system/common/model/opsi_role_model.dart';
import 'package:inventory_system/features/user/data/datasource/user_remote_data_source.dart';
import 'package:inventory_system/features/user/data/model/user_model.dart';
import 'package:inventory_system/features/user/domain/params/user_params.dart';
import 'package:inventory_system/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDataSource userRemoteDataSource;
  final CommonRemoteDataSource commonRemoteDataSource;

  UserRepositoryImpl(
      {required this.userRemoteDataSource, required this.commonRemoteDataSource,});

  @override
  Future<OpsiRoleModel> opsiRole() {
    try {
      return commonRemoteDataSource.getOpsiRole();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseModel> postUser(SendUserParams params) {
    try {
      return userRemoteDataSource.postUser(params: params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseModel> updateUser(SendUserParams params) {
    try {
      return userRemoteDataSource.updateUser(params: params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseModel> deleteUser(String id) {
    try {
      return userRemoteDataSource.deleteUser(id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser() {
    try {
      return userRemoteDataSource.getUser();
    } catch (e) {
      rethrow;
    }
  }

  
}