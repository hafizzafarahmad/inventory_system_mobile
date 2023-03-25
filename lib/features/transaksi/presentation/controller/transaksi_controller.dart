
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:inventory_system/features/transaksi/data/model/transaksi_model.dart';
import 'package:inventory_system/features/transaksi/domain/repository/transaksi_repository.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../../../common/widgets/snackbar/app_snackbar.dart';


class TransaksiController extends GetxController {
  final TransaksiRepository transaksiRepository;

  TransaksiController(
      {required this.transaksiRepository});

  final debouncer = Debouncer(delay: const Duration(milliseconds: 0));

  final List<Tab> tabs = <Tab>[
    const Tab(text: "Barang Masuk"),
    const Tab(text: "Barang Keluar"),
  ];

  List<TransaksiData> listIn = [];
  List<TransaksiData> listOut = [];

  bool isLoading = false;
  String? barcode;

  onRefresh() async {
    getTransaksiIn();
    getTransaksiOut();
  }

  getTransaksiIn() async {
    listIn = [];
    isLoading = true;
    update();
    //
    try{
      final res = await transaksiRepository.getIn();

      if ((res.code == "200")) {
        listIn = res.results?.item ?? [];
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    isLoading = false;
    update();
  }
  getTransaksiOut() async {
    listOut = [];
    isLoading = true;
    update();
    //
    try{
      final res = await transaksiRepository.getOut();

      if ((res.code == "200")) {
        listOut = res.results?.item ?? [];
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    isLoading = false;
    update();
  }

  postIn() async {
    EasyLoading.show(status: 'Menyimpan data...');
    try{
      final res = await transaksiRepository.postIn(
        barcode!
      );

      if(res.code == "200"){
        barcode = null;
        getTransaksiIn();
        AppSnackbar.succes("Berhasil", "Barang berhasil di tambahkan");
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  postOut() async {
    EasyLoading.show(status: 'Menyimpan data...');
    try{
      final res = await transaksiRepository.postOut(
          barcode!
      );

      if(res.code == "200"){
        barcode = null;
        getTransaksiOut();
        AppSnackbar.succes("Berhasil", "Barang berhasil di kurangi");
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  goToOpenScanner(BuildContext context, String type) async {
    try {
      barcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if(type == 'in'){
        await postIn();
      } else {
        await postOut();
      }

    } on PlatformException {
      // barcodeScanRes = 'Failed to get platform version.';
    }
    // FlutterBarcodeScanner.getBarcodeStreamReceiver("#ff6666", "Cancel", false, ScanMode.DEFAULT)!.listen((barcode) {
    //   debouncer.call(() {
    //     debugPrint(barcode);
    //     FlutterBeep.beep();
    //   });
    //   // debugPrint(barcode);
    //   // AppSnackbar.succes("succes", barcode);
    //   /// barcode to be used
    // });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    onRefresh();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
