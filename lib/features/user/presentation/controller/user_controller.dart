
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:inventory_system/common/model/opsi_role_model.dart';
import 'package:inventory_system/features/user/domain/model/user_model.dart';
import 'package:inventory_system/features/user/domain/params/user_params.dart';
import 'package:inventory_system/features/user/domain/repository/user_repository.dart';
import '../../../../common/widgets/snackbar/app_snackbar.dart';
import '../../../../core/route/route_constant.dart';


class UserController extends GetxController {
  final UserRepository userRepository;

  UserController(
      {required this.userRepository});

  final formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isLoading = false;
  List<UserData> list = [];
  UserData? selectedUserData;
  List<RoleData> opsiRole = [];
  RoleData? selectedRole;

  getOpsiRole() async {
    EasyLoading.show(status: 'Loading...');
    opsiRole = [];
    update();
    try{
      final res = await userRepository.opsiRole();

      if ((res.code == "200")) {
        opsiRole = res.results?.role?.data ?? [];
      }
    } catch (e){
      // AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  onRefresh() async {
    getUser();
  }

  getUser() async {
    list = [];
    isLoading = true;
    update();
    //
    try{
      final res = await userRepository.getUser();

      if ((res.code == "200")) {
        list = res.results?.users?.data ?? [];
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    isLoading = false;
    update();
  }
  tambahtUser() async {
    EasyLoading.show(status: 'Menyimpan data...');
    try{
      final res = await userRepository.postUser(SendUserParams(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
          idRole: selectedRole!.id.toString()
        )
      );

      if(res.code == "200"){
        Get.back();
        AppSnackbar.succes("Berhasil", "User berhasil di tambahkan");
        onRefresh();
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  ubahUser() async {
    EasyLoading.show(status: 'Menyimpan data...');
    try{
      final res = await userRepository.updateUser(SendUserParams(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
          idRole: selectedRole!.id.toString()
      )
      );

      if(res.code == "200"){
        Get.back();
        AppSnackbar.succes("Berhasil", "User berhasil di ubah");
        onRefresh();
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }
  deleteUser({required String id}) async {
    EasyLoading.show(status: 'Menghapus Data...');
    try{
      final res = await userRepository.deleteUser(id);
      if(res.code == "200"){
        AppSnackbar.succes("Berhasil", "User berhasil di hapus");
        onRefresh();
      }
    } catch (e){
      // AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  goToAddUser(){
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    selectedRole = null;
    selectedUserData = null;
    Get.toNamed(RouteConstant.addUser);
  }

  goToUpdateUser(){
    firstNameController.text = selectedUserData?.firstName ?? "";
    lastNameController.text = selectedUserData?.lastName ?? "";
    emailController.text = selectedUserData?.email ?? "";
    passwordController.text = "";
    confirmPasswordController.text = "";
    phoneController.text = selectedUserData?.phone ?? "";
    selectedRole = opsiRole.firstWhereOrNull((element) => element.id == selectedUserData!.roles!.first.id);
    Get.toNamed(RouteConstant.addUser);
    update();
  }

  // goToDetailSertifikat(SertifikatData data){
  //   sertifikatData = data;
  //   Get.toNamed(RouteConstant.detailSertifikat);
  //   update();
  // }
  //
  // goToUpdateSertifikat(){
  //   for (var data in opsiSertifikat){
  //     if(data.id.toString() == sertifikatData!.idJenis){
  //       selectedOpsiSertifikat = data;
  //     }
  //   }
  //   lembagaController.text = sertifikatData!.lembaga!;
  //   tglSertifikatController.text = FormatDate.setPlainDate(sertifikatData!.tglSertifikasi!);
  //   tglSertifikat = sertifikatData!.tglSertifikasi!;
  //   tglExpireController.text = FormatDate.setPlainDate(sertifikatData!.expireDate!);
  //   tglExpire = sertifikatData!.expireDate!;
  //   documentImage = sertifikatData!.attachment!;
  //
  //   update();
  //
  //   Get.toNamed(RouteConstant.addSertifikat);
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    onRefresh();
    getOpsiRole();
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
