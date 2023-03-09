import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_system/dependency_injection.dart';
import 'package:inventory_system/features/auth/presentation/controller/auth_controller.dart';

import '../../../../common/widgets/button/button_widget.dart';
import '../../../../common/widgets/textfield/custom_textfield.dart';
import '../../../../core/style/app_color.dart';
import '../../../../core/style/size_apps.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthController>(
      init: AuthController(authRepository: sl()),
      builder: (AuthController controller) {
        return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Form(
                    key: controller.formKey,
                    child: SizedBox(
                      height: SizeApps.height(context, size: 1) - 30,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 25.0, bottom: 24.0),
                        child: Column(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height * 0.1),
                            Image.asset("assets/logo-inventory.png", width: SizeApps.width(context, size: 0.5),),
                            const Padding(
                              padding: EdgeInsets.only(top: 35.0, bottom: 16),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Sign in",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey
                                      )

                                  )),
                            ),
                            CustomTextField(
                              hintText: 'Email',
                              controller: controller.emailController,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'User ID tidak boleh kosong';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              obscureText: true,
                              isPassword: true,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                              hintText: 'Password',
                              controller: controller.passwordController,
                            ),
                            const SizedBox(height: 50,),
                            SizedBox(
                              height: 54,
                              width: double.infinity,
                              child: ButtonWidget.submit(
                                  text: "Login",
                                  fontSize: 16,
                                  onPress: (){
                                    if(controller.formKey.currentState!.validate()){
                                      controller.loginUser(
                                          controller.emailController.text,
                                          controller.passwordController.text);
                                    }
                                  }
                              ),
                            ),

                            const Expanded(child: SizedBox()),

                            const SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                "1.0.0.0",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppColor.thirdColor
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ),
                )));
      },
    );
  }
}
