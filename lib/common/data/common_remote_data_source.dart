import 'package:inventory_system/common/model/opsi_role_model.dart';
import 'package:inventory_system/core/network/api_endpoint.dart';
import '../../../../core/network/app_network.dart';

class CommonRemoteDataSource {

  Future<OpsiRoleModel> getOpsiRole() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.opsiRole,);
      return OpsiRoleModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }

}