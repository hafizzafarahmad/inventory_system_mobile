import 'package:inventory_system/common/model/opsi_category_model.dart';
import 'package:inventory_system/common/model/opsi_color_model.dart';
import 'package:inventory_system/common/model/opsi_role_model.dart';
import 'package:inventory_system/common/model/opsi_size_model.dart';
import 'package:inventory_system/common/model/opsi_vendor_model.dart';
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

  Future<OpsiColorModel> getOpsiColor() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.opsiColor,);
      return OpsiColorModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<OpsiCategoryModel> getOpsiCategory() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.opsiCategory,);
      return OpsiCategoryModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<OpsiSizeModel> getOpsiSize() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.opsiSize,);
      return OpsiSizeModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<OpsiVendorModel> getOpsiVendor() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.opsiVendor,);
      return OpsiVendorModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }

}