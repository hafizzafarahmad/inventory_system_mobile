import 'package:inventory_system/common/model/opsi_category_model.dart';
import 'package:inventory_system/common/model/opsi_color_model.dart';
import 'package:inventory_system/common/model/opsi_size_model.dart';
import 'package:inventory_system/common/model/opsi_vendor_model.dart';
import 'package:inventory_system/features/barang/data/model/barang_model.dart';
import 'package:inventory_system/features/barang/domain/params/barang_params.dart';

import '../../../../common/model/base_model.dart';

abstract class BarangRepository {
  Future<BarangModel> getBarang();
  Future<OpsiVendorModel> opsiVendor();
  Future<OpsiSizeModel> opsiSize();
  Future<OpsiCategoryModel> opsiCategory();
  Future<OpsiColorModel> opsiColor();
  Future<BaseModel> postBarang(SendBarangParams params);
  Future<BaseModel> updateBarang(SendBarangParams params);
  Future<BaseModel> deleteBarang(String id);
}
