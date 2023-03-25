
import 'package:inventory_system/common/data/common_remote_data_source.dart';
import 'package:inventory_system/common/model/base_model.dart';
import 'package:inventory_system/common/model/opsi_category_model.dart';
import 'package:inventory_system/common/model/opsi_color_model.dart';
import 'package:inventory_system/common/model/opsi_role_model.dart';
import 'package:inventory_system/common/model/opsi_size_model.dart';
import 'package:inventory_system/common/model/opsi_vendor_model.dart';
import 'package:inventory_system/features/barang/data/datasource/barang_remote_data_source.dart';
import 'package:inventory_system/features/barang/data/model/barang_model.dart';
import 'package:inventory_system/features/barang/domain/params/barang_params.dart';
import 'package:inventory_system/features/barang/domain/repository/barang_repository.dart';
import 'package:inventory_system/features/user/data/datasource/user_remote_data_source.dart';
import 'package:inventory_system/features/user/data/model/user_model.dart';
import 'package:inventory_system/features/user/domain/params/user_params.dart';
import 'package:inventory_system/features/user/domain/repository/user_repository.dart';

class BarangRepositoryImpl implements BarangRepository{
  final BarangRemoteDataSource barangRemoteDataSource;
  final CommonRemoteDataSource commonRemoteDataSource;

  BarangRepositoryImpl(
      {required this.barangRemoteDataSource, required this.commonRemoteDataSource,});


  @override
  Future<BaseModel> deleteBarang(String id) {
    try {
      return barangRemoteDataSource.deleteBarang(id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OpsiCategoryModel> opsiCategory() {
    try {
      return commonRemoteDataSource.getOpsiCategory();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OpsiColorModel> opsiColor() {
    try {
      return commonRemoteDataSource.getOpsiColor();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OpsiSizeModel> opsiSize() {
    try {
      return commonRemoteDataSource.getOpsiSize();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OpsiVendorModel> opsiVendor() {
    try {
      return commonRemoteDataSource.getOpsiVendor();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseModel> postBarang(SendBarangParams params) {
    try {
      return barangRemoteDataSource.postBarang(params: params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseModel> updateBarang(SendBarangParams params) {
    try {
      return barangRemoteDataSource.updateBarang(params: params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BarangModel> getBarang() {
    try {
      return barangRemoteDataSource.getBarang();
    } catch (e) {
      rethrow;
    }
  }

  
}