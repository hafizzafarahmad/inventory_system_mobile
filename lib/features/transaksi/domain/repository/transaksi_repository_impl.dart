
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
import 'package:inventory_system/features/transaksi/data/datasource/transaksi_remote_data_source.dart';
import 'package:inventory_system/features/transaksi/data/model/transaksi_model.dart';
import 'package:inventory_system/features/transaksi/domain/repository/transaksi_repository.dart';
import 'package:inventory_system/features/user/data/datasource/user_remote_data_source.dart';
import 'package:inventory_system/features/user/data/model/user_model.dart';
import 'package:inventory_system/features/user/domain/params/user_params.dart';
import 'package:inventory_system/features/user/domain/repository/user_repository.dart';

class TransaksiRepositoryImpl implements TransaksiRepository{
  final TransaksiRemoteDataSource transaksiRemoteDataSource;

  TransaksiRepositoryImpl(
      {required this.transaksiRemoteDataSource,});


  @override
  Future<BaseModel> postIn(String barcode) {
    try {
      return transaksiRemoteDataSource.postIn(barcode: barcode);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseModel> postOut(String barcode) {
    try {
      return transaksiRemoteDataSource.postOut(barcode: barcode);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TransaksiModel> getIn() {
    try {
      return transaksiRemoteDataSource.getTransaksiIn();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TransaksiModel> getOut() {
    try {
      return transaksiRemoteDataSource.getTransaksiOut();
    } catch (e) {
      rethrow;
    }
  }

  
}