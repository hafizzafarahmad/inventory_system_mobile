import 'package:dio/dio.dart';
import 'package:inventory_system/common/model/base_model.dart';
import 'package:inventory_system/core/network/api_endpoint.dart';
import 'package:inventory_system/features/transaksi/data/model/transaksi_model.dart';
import '../../../../core/network/app_network.dart';
class TransaksiRemoteDataSource {

  Future<TransaksiModel> getTransaksiIn() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.listIncomingGoods,

      );
      return TransaksiModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<TransaksiModel> getTransaksiOut() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.listOutcomingGoods,

      );
      return TransaksiModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<BaseModel> postIn({
    required String barcode,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        "barcode": barcode,
      });

      final res = await AppNetworkClient.post(path: ApiEndPoint.incomingGoods,
        form: formdata,
      );
      return BaseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }


  Future<BaseModel> postOut({
    required String barcode,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        "barcode": barcode,
      });

      final res = await AppNetworkClient.post(path: ApiEndPoint.outcomingGoods,
        form: formdata,
      );
      return BaseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}