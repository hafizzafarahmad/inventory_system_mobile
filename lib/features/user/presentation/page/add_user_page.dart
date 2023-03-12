import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_system/common/model/opsi_role_model.dart';
import 'package:inventory_system/common/widgets/textfield/custom_textfield.dart';
import 'package:inventory_system/dependency_injection.dart';
import 'package:inventory_system/features/auth/data/model/login_model.dart';

import '../../../../core/helper/format_date.dart';
import '../../../../core/style/app_color.dart';
import '../../../../core/style/size_apps.dart';
import '../controller/user_controller.dart';

class AddUserPage extends StatefulWidget {

  const AddUserPage({Key? key}) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(userRepository: sl()),
      builder: (UserController controller) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: AppColor.mainColor,
              centerTitle: true,
              leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: const Icon(Icons.chevron_left, color: Colors.white,),
              ),
              title: Text(
                controller.selectedUserData != null ? 'Ubah User' : 'Tambah User',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ///Role
                        const Text(
                          'Role',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        DropdownButtonFormField<RoleData>(
                          hint: const Text("Pilih Role"),
                          validator: (value) {
                            debugPrint(value.toString());
                            if (value == null) {
                              return "Role tidak boleh kosong";
                            }
                            return null;
                          },
                          items: controller.opsiRole.isEmpty
                              ? []
                              : controller.opsiRole
                              .map((item) => DropdownMenuItem<RoleData>(
                            value: item,
                            child: Text(item.name!),
                          ))
                              .toList(),
                          onChanged: (value) {
                            controller.selectedRole = value!;
                          },
                          value: controller.selectedRole,
                        ),
                        const SizedBox(height: 20,),

                        ///Name Depan
                        const Text(
                          'Nama Depan',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          hintText: 'Masukan Nama Depan Penyelenggara',
                          controller: controller.firstNameController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Nama Depan tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Name Belakang
                        const Text(
                          'Nama Belakang',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          hintText: 'Masukan Nama Belakang',
                          controller: controller.lastNameController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Nama Belakang tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Email
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          hintText: 'Masukan Email Penyelenggara',
                          controller: controller.emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Email tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///No.HP
                        const Text(
                          'No.HP',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          hintText: 'Masukan No.HP Penyelenggara',
                          controller: controller.phoneController,
                          textInputType: TextInputType.phone,
                          validator: (val){
                            if(val!.isEmpty){
                              return "No.HP  tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Password
                        const Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          obscureText: true,
                          isPassword: true,
                          validator: (val){
                            if(val!.isEmpty){
                              return 'Password tidak boleh kosong';
                            }
                            if(val.length < 8){
                              return 'Password Minimal 8 karakter';
                            }
                            if(controller.confirmPasswordController.text != val){
                              return 'Konfirmasi Password tidak cocok';
                            }
                            return null;
                          },
                          hintText: 'Password',
                          controller: controller.passwordController,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Konfirmasi Password
                        const Text(
                          'Konfirmasi Password',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          obscureText: true,
                          isPassword: true,
                          validator: (val){
                            if(val!.isEmpty){
                              return 'Konfirmasi Password tidak boleh kosong';
                            }
                            if(val.length < 8){
                              return 'Password Minimal 8 karakter';
                            }
                            if(controller.passwordController.text != val){
                              return 'Konfirmasi Password tidak cocok';
                            }
                            return null;
                          },
                          hintText: 'Konfirmasi Password',
                          controller: controller.confirmPasswordController,
                          textInputAction: TextInputAction.done,
                        ),

                      ]
                  ),
                ),
              ),
            ),
            bottomNavigationBar: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(top: BorderSide(color: Colors.black12, width: 1)),
                        ),
                        child: SizedBox(
                          width: SizeApps.width(context, size: 1),
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            child: const Text("Simpan"),
                            onPressed: () {
                              if(controller.formKey.currentState!.validate()){
                                if(controller.selectedUserData != null){
                                  controller.ubahUser();
                                } else {
                                  controller.tambahtUser();
                                }
                              }
                            },
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
