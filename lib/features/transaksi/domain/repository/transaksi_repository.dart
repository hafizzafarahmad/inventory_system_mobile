import 'package:inventory_system/features/barang/data/model/barang_model.dart';
import 'package:inventory_system/features/transaksi/data/model/transaksi_model.dart';

import '../../../../common/model/base_model.dart';

abstract class TransaksiRepository {
  Future<TransaksiModel> getIn();
  Future<TransaksiModel> getOut();
  Future<BaseModel> postIn(String barcode);
  Future<BaseModel> postOut(String barcode);
}
