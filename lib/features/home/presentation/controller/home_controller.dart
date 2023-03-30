import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:inventory_system/common/model/menu_model.dart';
import 'package:inventory_system/core/environment/local_data_constans.dart';
import 'package:inventory_system/core/style/app_color.dart';

import '../../../../core/route/route_constant.dart';

class HomeController extends GetxController {

  final storage = const FlutterSecureStorage();
  String? name, email;

  int jmlBarang = 0;
  int jmlStokHampirHabis = 0;
  int jmlStokHabis = 0;
  List<MenuModel> menu = [];

  List<Color> color = [
    AppColor.style1,
    AppColor.style2,
    AppColor.style3,
    AppColor.style4,
    AppColor.style5,
    AppColor.style6,
  ];

  onRefresh() async {
    name = await storage.read(key: LocalDataConstant.name);
    email = await storage.read(key: LocalDataConstant.email);
    update();
  }

  setMenu(){
    menu.clear();
    menu.addAll([
      MenuModel(key: 'user', name: 'Data User', id: '1', icon: Icons.person_outline_rounded),
      MenuModel(key: 'barang', name: 'Data Barang', id: '2', icon: Icons.warehouse_outlined),
      MenuModel(key: 'transaksi', name: 'Transaksi Barang', id: '3', icon: Icons.production_quantity_limits_outlined),
    ]);
    update();
  }

  void logout() async {
    await storage.deleteAll();
    Get.closeAllSnackbars();
    return Get.offAllNamed(RouteConstant.login);
  }

  goToMenu(String key){
    switch (key) {
      case "user":
        return Get.toNamed(RouteConstant.user);
      case "barang":
        return Get.toNamed(RouteConstant.barang);
      case "transaksi":
        return Get.toNamed(RouteConstant.transaksi);
      default:
        return null;
    }
  }

  @override
  void onInit() {
    setMenu();
    onRefresh();
    super.onInit();
  }


}
