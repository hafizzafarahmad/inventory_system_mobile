import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_system/core/style/app_color.dart';

import '../../../../dependency_injection.dart';
import '../controller/auth_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AuthController>(
      init: AuthController(authRepository: sl()),
      builder: (AuthController controller) {
        return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo-inventory.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5),
                  const CircularProgressIndicator(color: AppColor.mainColor,)
                  // SvgPicture.asset(Utils.LOGO)
                ],
              ),
            ));
      },
    );
  }
}
