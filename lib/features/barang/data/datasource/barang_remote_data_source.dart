import 'package:dio/dio.dart';
import 'package:inventory_system/common/model/base_model.dart';
import 'package:inventory_system/core/network/api_endpoint.dart';
import 'package:inventory_system/features/barang/data/model/barang_model.dart';
import 'package:inventory_system/features/barang/domain/params/barang_params.dart';
import 'package:http_parser/http_parser.dart';
import 'package:inventory_system/features/user/domain/params/user_params.dart';
import '../../../../core/network/app_network.dart';
class BarangRemoteDataSource {


  Future<BarangModel> getBarang() async {
    try {
      final res = await AppNetworkClient.get(path: ApiEndPoint.item,

      );
      return BarangModel.fromJson(res.data);
    } catch (e) {
      throw e.toString();
    }
  }
  Future<BaseModel> postBarang({
    required SendBarangParams params,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        "item_name": params.itemName,
        "category_id" : params.idCategory,
        "size_id" : params.idSize,
        "color_id" : params.idColor,
        "uom" : params.uom,
        "purchase_price" : params.purchasePrice,
        "price" : params.price,
        "quantity" : params.quantity,
        "description" : params.desc,
        "vendor_id" : params.idVendor,
      });
      
      if(params.image != null){
        formdata.files.add(MapEntry("image", await MultipartFile.fromFile(params.image!,
            filename: params.image.toString().split('/').last,
            contentType: MediaType('image', "*"))));
      }

      final res = await AppNetworkClient.post(path: ApiEndPoint.item,
        form: formdata,
      );
      return BaseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }


  Future<BaseModel> updateBarang({
    required SendBarangParams params,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        "_method": "PUT",
        "item_name": params.itemName,
        "category_id" : params.idCategory,
        "size_id" : params.idSize,
        "color_id" : params.idColor,
        "uom" : params.uom,
        "purchase_price" : params.purchasePrice,
        "price" : params.price,
        // "quantity" : params.quantity,
        "description" : params.desc,
        "vendor_id" : params.idVendor,
      });

      if(params.image != null){
        formdata.files.add(MapEntry("image", await MultipartFile.fromFile(params.image!,
            filename: params.image.toString().split('/').last,
            contentType: MediaType('image', "*"))));
      }

      final res = await AppNetworkClient.post(path: '${ApiEndPoint.item}?method=PUT',
        form: formdata,
      );
      return BaseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }


  Future<BaseModel> deleteBarang({
    required String id,
  }) async {
    try {
      final res = await AppNetworkClient.delete(path: '${ApiEndPoint.item}/$id/delete',
      );
      return BaseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

}