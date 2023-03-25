import 'package:get/get.dart';
import 'package:inventory_system/core/route/route_constant.dart';
import 'package:inventory_system/features/auth/presentation/page/splash_page.dart';
import 'package:inventory_system/features/barang/presentation/page/add_barang_page.dart';
import 'package:inventory_system/features/barang/presentation/page/barang_page.dart';
import 'package:inventory_system/features/home/presentation/page/home_page.dart';
import 'package:inventory_system/features/transaksi/presentation/page/transaksi_page.dart';
import 'package:inventory_system/features/user/presentation/page/add_user_page.dart';
import 'package:inventory_system/features/user/presentation/page/user_page.dart';

import '../../features/auth/presentation/page/login_page.dart';

class AppRoute {
  static final List<GetPage> all = [
    //TODO: Register your screen in here
    GetPage(name: RouteConstant.splash, page: () => SplashPage()),
    GetPage(name: RouteConstant.login, page: () => LoginPage()),
    GetPage(name: RouteConstant.home, page: () => const HomePage()),
    GetPage(name: RouteConstant.user, page: () => const UserPage()),
    GetPage(name: RouteConstant.addUser, page: () => const AddUserPage()),
    GetPage(name: RouteConstant.addBarang, page: () => const AddBarangPage()),
    GetPage(name: RouteConstant.barang, page: () => const BarangPage()),
    GetPage(name: RouteConstant.transaksi, page: () => const TransaksiPage()),
  ];
}
