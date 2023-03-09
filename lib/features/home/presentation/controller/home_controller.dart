import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_system/common/model/menu_model.dart';

class HomeController extends GetxController {

  int jmlBarang = 75;
  int jmlStokHampirHabis = 30;
  int jmlStokHabis = 10;
  List<MenuModel> menu = [];

  setMenu(){
    menu.clear();
    menu.addAll([
      MenuModel(key: 'user', name: 'Data User', id: '1', icon: Icons.person_outline_rounded),
      MenuModel(key: 'barang', name: 'Data Barang', id: '2', icon: Icons.warehouse_outlined),
      MenuModel(key: 'transaksi', name: 'Transaksi Barang', id: '3', icon: Icons.production_quantity_limits_outlined),
    ]);
    update();
  }

  @override
  void onInit() {
    setMenu();
    super.onInit();
  }


}
