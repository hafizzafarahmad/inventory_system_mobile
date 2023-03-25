
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_system/common/model/opsi_category_model.dart';
import 'package:inventory_system/common/model/opsi_color_model.dart';
import 'package:inventory_system/common/model/opsi_size_model.dart';
import 'package:inventory_system/common/model/opsi_vendor_model.dart';
import 'package:inventory_system/features/barang/data/model/barang_model.dart';
import 'package:inventory_system/features/barang/domain/params/barang_params.dart';
import 'package:inventory_system/features/barang/domain/repository/barang_repository.dart';
import '../../../../common/widgets/snackbar/app_snackbar.dart';
import '../../../../core/route/route_constant.dart';


class BarangController extends GetxController {
  final BarangRepository barangRepository;

  BarangController(
      {required this.barangRepository});

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  String? image;

  List<BarangData> list = [];
  BarangData? selectedBarangData;

  List<CategoryData> opsiCategory = [];
  List<SizeData> opsiSize = [];
  List<ColorData> opsiColor= [];
  List<VendorData> opsiVendor = [];
  CategoryData? selectedCategory;
  SizeData? selectedSize;
  ColorData? selectedColor;
  VendorData? selectedVendor;

  void uploadChoice(context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc){
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                color: Colors.white
            ),
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text('Take New Photo'),
                    onTap: () => {
                      openCamera()
                    }
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Select Photo or File'),
                  onTap: () {
                    openFileExplorer();
                  },
                ),
              ],
            ),
          );
        }
    );
  }
  openCamera() async {
    try{
      final picker = ImagePicker();
      final file = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 1000,
        maxWidth: 1000,
      );
      if(file != null){
        image = file.path;

        // CroppedFile? croppedFile = await ImageCropper.sourcePath(
        //     sourcePath: file.path,
        //     maxHeight: 1000,
        //     maxWidth: 1000,
        //     aspectRatioPresets: [
        //       CropAspectRatioPreset.square,
        //       CropAspectRatioPreset.ratio3x2,
        //       CropAspectRatioPreset.original,
        //       CropAspectRatioPreset.ratio4x3,
        //       CropAspectRatioPreset.ratio16x9
        //     ],
        //     androidUiSettings: AndroidUiSettings(
        //         toolbarTitle: '',
        //         toolbarColor: Pigment.fromString(PRIMARY_COLOR),
        //         toolbarWidgetColor: Colors.white,
        //         initAspectRatio: CropAspectRatioPreset.original,
        //         lockAspectRatio: false),
        //     iosUiSettings: IOSUiSettings(
        //       minimumAspectRatio: 1.0,
        //     )
        // );
        // if(croppedFile != null){
        //   setState(() {
        //     filePath = croppedFile.path;
        //   });
        //   Navigator.pop(context);
        // }
        Get.back();
      }
    }on NoSuchMethodError catch(e){
      print(e);
    }
  }
  openFileExplorer() async {
    try{
      final file = await FilePicker.platform.pickFiles(
          type: FileType.any,
          allowMultiple: false
      );

      if(file != null){
        if(file.paths.first!.split(".").last.toLowerCase() == "pdf" ||
            file.paths.first!.split(".").last.toLowerCase() == "jpg" ||
            file.paths.first!.split(".").last.toLowerCase() == "jpeg" ||
            file.paths.first!.split(".").last.toLowerCase() == "png") {
          image = file.paths.first;
          Get.back();
        }
        // Navigator.pop(context);
      } else {
        // alertToast("File harus berupa image/pdf.");
      }
    }catch(e){
      print(e);
    }


  }

  getOpsiCategory() async {
    EasyLoading.show(status: 'Loading...');
    opsiCategory = [];
    update();
    try{
      final res = await barangRepository.opsiCategory();

      if ((res.code == "200")) {
        opsiCategory = res.results?.category?.data ?? [];
      }
    } catch (e){
      // AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }
  getOpsiSize() async {
    EasyLoading.show(status: 'Loading...');
    opsiSize = [];
    update();
    try{
      final res = await barangRepository.opsiSize();

      if ((res.code == "200")) {
        opsiSize = res.results?.sizes?.data ?? [];
      }
    } catch (e){
      // AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }
  getOpsiColor() async {
    EasyLoading.show(status: 'Loading...');
    opsiColor = [];
    update();
    try{
      final res = await barangRepository.opsiColor();

      if ((res.code == "200")) {
        opsiColor = res.results?.colors?.data ?? [];
      }
    } catch (e){
      // AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }
  getOpsiVendor() async {
    EasyLoading.show(status: 'Loading...');
    opsiVendor = [];
    update();
    try{
      final res = await barangRepository.opsiVendor();

      if ((res.code == "200")) {
        opsiVendor = res.results?.vendor?.data ?? [];
      }
    } catch (e){
      // AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  onRefresh() async {
    getBarang();
  }

  getBarang() async {
    list = [];
    isLoading = true;
    update();
    //
    try{
      final res = await barangRepository.getBarang();

      if ((res.code == "200")) {
        list = res.results?.item?.data ?? [];
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    isLoading = false;
    update();
  }

  tambah() async {
    EasyLoading.show(status: 'Menyimpan data...');
    try{
      final res = await barangRepository.postBarang(
        SendBarangParams(
          itemName: itemNameController.text,
          idCategory: selectedCategory!.id!,
          idSize: selectedSize!.id!,
          idColor: selectedColor!.id!,
          idVendor: selectedVendor!.id!,
          uom: uomController.text,
          purchasePrice: purchasePriceController.text.replaceAll('.', ''),
          price: priceController.text.replaceAll('.', ''),
          quantity: quantityController.text.replaceAll('.', ''),
          desc: descController.text,
          image: image!
        )
      );

      if(res.code == "200"){
        Get.back();
        AppSnackbar.succes("Berhasil", "Barang berhasil di tambahkan");
        onRefresh();
      }
    } catch (e){
      AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  ubah() async {
    EasyLoading.show(status: 'Menyimpan data...');
    try{
      final res = await barangRepository.updateBarang(
          SendBarangParams(
              itemName: itemNameController.text,
              idCategory: selectedCategory!.id!,
              idSize: selectedSize!.id!,
              idColor: selectedColor!.id!,
              idVendor: selectedVendor!.id!,
              uom: uomController.text,
              purchasePrice: purchasePriceController.text.replaceAll('.', ''),
              price: priceController.text.replaceAll('.', ''),
              quantity: quantityController.text.replaceAll('.', ''),
              desc: descController.text,
              image: image!
          )
      );

      if(res.code == "200"){
        Get.back();
        AppSnackbar.succes("Berhasil", "Barang berhasil di ubah");
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
      final res = await barangRepository.deleteBarang(id);
      if(res.code == "200"){
        AppSnackbar.succes("Berhasil", "Barang berhasil di hapus");
        onRefresh();
      }
    } catch (e){
      // AppSnackbar.error("Error", e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  goToAddBarang(){
    itemNameController.clear();
    uomController.clear();
    purchasePriceController.clear();
    priceController.clear();
    quantityController.clear();
    descController.clear();
    selectedVendor = null;
    selectedColor = null;
    selectedSize = null;
    selectedCategory = null;
    selectedBarangData = null;
    image = null;
    Get.toNamed(RouteConstant.addBarang);
  }

  goToUpdateUser(){
    itemNameController.text = selectedBarangData?.itemName ?? "";
    uomController.text =  selectedBarangData?.uom ?? "";
    purchasePriceController.text =  selectedBarangData?.purchasePrice ?? "";
    priceController.text =  selectedBarangData?.price ?? "";
    quantityController.text =  selectedBarangData?.quantity ?? "";
    descController.text =  selectedBarangData?.description ?? "";
    selectedCategory = opsiCategory.firstWhereOrNull((element) => element.id == selectedBarangData!.categoryId);
    selectedSize = opsiSize.firstWhereOrNull((element) => element.id == selectedBarangData!.sizeId);
    selectedColor = opsiColor.firstWhereOrNull((element) => element.id == selectedBarangData!.colorId);
    selectedVendor = opsiVendor.firstWhereOrNull((element) => element.id == selectedBarangData!.vendorId);
    image = selectedBarangData?.imageUrl ?? "";
    Get.toNamed(RouteConstant.addBarang);
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
    getOpsiCategory();
    getOpsiVendor();
    getOpsiSize();
    getOpsiColor();
    super.onInit();
  }

  @override
  void onClose() {
    itemNameController.dispose();
    uomController.dispose();
    purchasePriceController.dispose();
    priceController.dispose();
    quantityController.dispose();
    descController.dispose();
    super.onClose();
  }
}
