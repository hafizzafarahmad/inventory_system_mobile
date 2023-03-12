import 'package:dio/dio.dart';
import 'package:inventory_system/common/model/base_model.dart';
import 'package:inventory_system/core/network/api_endpoint.dart';
import 'package:inventory_system/features/user/domain/model/user_model.dart';
import 'package:inventory_system/features/user/domain/params/user_params.dart';
import '../../../../core/network/app_network.dart';
class UserRemoteDataSource {

  Future<UserModel> getUser() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.user,

      );
      return UserModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<BaseModel> postUser({
    required SendUserParams params,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        "first_name": params.firstName,
        "last_name" : params.lastName,
        "email" : params.email,
        "password" : params.password,
        "phone" : params.phone,
        "role_id" : params.idRole,
      });

      final res = await AppNetworkClient.post(path: ApiEndPoint.user,
        form: formdata,
      );
      return BaseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }


  Future<BaseModel> updateUser({
    required SendUserParams params,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        "_method": "PUT",
        "first_name": params.firstName,
        "last_name" : params.lastName,
        "email" : params.email,
        "password" : params.password,
        "phone" : params.phone,
        "role_id" : params.idRole,
      });

      final res = await AppNetworkClient.post(path: ApiEndPoint.user,
        form: formdata,
      );
      return BaseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }


  Future<BaseModel> deleteUser({
    required String id,
  }) async {
    try {
      final res = await AppNetworkClient.delete(path: '${ApiEndPoint.user}/$id',
      );
      return BaseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

}