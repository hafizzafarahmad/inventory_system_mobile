import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:inventory_system/common/widgets/snackbar/app_snackbar.dart';
import 'package:inventory_system/core/environment/local_data_constans.dart';
import 'package:inventory_system/features/auth/domain/params/login_params.dart';
import 'package:inventory_system/features/auth/domain/repository/auth_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/route/route_constant.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController(
      {required this.authRepository});

  final storage = const FlutterSecureStorage();
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    checkUserSession();
  }

  void checkUserSession() async {
    String? token = await storage.read(key: LocalDataConstant.token);
    if(token != null){
      bool hasExpired = JwtDecoder.isExpired(token);

      if(!hasExpired){
        return Get.offNamed(RouteConstant.home);
      }
    }
    Future.delayed(const Duration(seconds: 3), () => Get.offNamed(RouteConstant.login));
  }
  void forceLogout() async {
    await storage.deleteAll();
    Get.closeAllSnackbars();
    AppSnackbar.warning("Warning", 'Session Expire');
    return Get.offAllNamed(RouteConstant.login);

  }

  void loginUser(String email, String password) async {
    EasyLoading.show(status: 'loading...');

    try{
      final res = await authRepository.login(
          LoginParams(username: emailController.text, password: passwordController.text));

      if ((res.code == "200")) {
        storage.write(key: "token", value: res.results!.user!.token);
        goToHomeScreen();
      } else {
        AppSnackbar.warning("Warning", res.message!);
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
  }

  void goToHomeScreen() => Get.offAndToNamed(RouteConstant.home);
}
