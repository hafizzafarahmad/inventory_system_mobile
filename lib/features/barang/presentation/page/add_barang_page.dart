import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_system/common/model/opsi_category_model.dart';
import 'package:inventory_system/common/model/opsi_color_model.dart';
import 'package:inventory_system/common/model/opsi_role_model.dart';
import 'package:inventory_system/common/model/opsi_size_model.dart';
import 'package:inventory_system/common/model/opsi_vendor_model.dart';
import 'package:inventory_system/common/widgets/textfield/custom_currency_textfield.dart';
import 'package:inventory_system/common/widgets/textfield/custom_textfield.dart';
import 'package:inventory_system/dependency_injection.dart';
import 'package:inventory_system/features/auth/data/model/login_model.dart';

import '../../../../core/helper/format_date.dart';
import '../../../../core/style/app_color.dart';
import '../../../../core/style/size_apps.dart';
import '../controller/barang_controller.dart';

class AddBarangPage extends StatefulWidget {

  const AddBarangPage({Key? key}) : super(key: key);

  @override
  State<AddBarangPage> createState() => _AddBarangPageState();
}

class _AddBarangPageState extends State<AddBarangPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarangController>(
      init: BarangController(barangRepository: sl()),
      builder: (BarangController controller) {
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
                controller.selectedBarangData != null ? 'Ubah Barang' : 'Tambah Barang',
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
                        ///Kategori
                        const Text(
                          'Kategori',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        DropdownButtonFormField<CategoryData>(
                          hint: const Text("Pilih Kategori"),
                          validator: (value) {
                            debugPrint(value.toString());
                            if (value == null) {
                              return "Kategori tidak boleh kosong";
                            }
                            return null;
                          },
                          items: controller.opsiCategory.isEmpty
                              ? []
                              : controller.opsiCategory
                              .map((item) => DropdownMenuItem<CategoryData>(
                            value: item,
                            child: Text(item.categoryName!),
                          ))
                              .toList(),
                          onChanged: (value) {
                            controller.selectedCategory = value!;
                          },
                          value: controller.selectedCategory,
                        ),
                        const SizedBox(height: 20,),

                        ///Warna
                        const Text(
                          'Warna',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        DropdownButtonFormField<ColorData>(
                          hint: const Text("Pilih Warna"),
                          validator: (value) {
                            debugPrint(value.toString());
                            if (value == null) {
                              return "Warna tidak boleh kosong";
                            }
                            return null;
                          },
                          items: controller.opsiColor.isEmpty
                              ? []
                              : controller.opsiColor
                              .map((item) => DropdownMenuItem<ColorData>(
                            value: item,
                            child: Text(item.colorName!),
                          ))
                              .toList(),
                          onChanged: (value) {
                            controller.selectedColor = value!;
                          },
                          value: controller.selectedColor,
                        ),
                        const SizedBox(height: 20,),

                        ///Ukuran
                        const Text(
                          'Ukuran',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        DropdownButtonFormField<SizeData>(
                          hint: const Text("Pilih Ukuran"),
                          validator: (value) {
                            debugPrint(value.toString());
                            if (value == null) {
                              return "Ukuran tidak boleh kosong";
                            }
                            return null;
                          },
                          items: controller.opsiSize.isEmpty
                              ? []
                              : controller.opsiSize
                              .map((item) => DropdownMenuItem<SizeData>(
                            value: item,
                            child: Text(item.sizeName!),
                          ))
                              .toList(),
                          onChanged: (value) {
                            controller.selectedSize = value!;
                          },
                          value: controller.selectedSize,
                        ),
                        const SizedBox(height: 20,),

                        ///Vendor
                        const Text(
                          'Vendor',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        DropdownButtonFormField<VendorData>(
                          hint: const Text("Pilih Vendor"),
                          validator: (value) {
                            debugPrint(value.toString());
                            if (value == null) {
                              return "Vendor tidak boleh kosong";
                            }
                            return null;
                          },
                          items: controller.opsiVendor.isEmpty
                              ? []
                              : controller.opsiVendor
                              .map((item) => DropdownMenuItem<VendorData>(
                            value: item,
                            child: Text(item.vendorName!),
                          ))
                              .toList(),
                          onChanged: (value) {
                            controller.selectedVendor = value!;
                          },
                          value: controller.selectedVendor,
                        ),
                        const SizedBox(height: 20,),

                        ///Nama Barang
                        const Text(
                          'Nama Barang',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          hintText: 'Masukan Nama Barang',
                          controller: controller.itemNameController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Nama Barang tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Kuantitas
                        const Text(
                          'Kuantitas',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomCurrencyTextField(
                          hintText: 'Masukan Kuantitas',
                          controller: controller.quantityController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Kuantitas tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Harga Pembelian
                        const Text(
                          'Harga Pembelian',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomCurrencyTextField(
                          hintText: 'Masukan Harga Pembelian',
                          controller: controller.purchasePriceController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Harga Pembelian tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Harga Barang
                        const Text(
                          'Harga Barang',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomCurrencyTextField(
                          hintText: 'Masukan Harga Barang',
                          controller: controller.priceController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Harga Barang tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Satuan
                        const Text(
                          'Satuan',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          hintText: 'Masukan Satuan',
                          controller: controller.uomController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Satuan tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Deskripsi
                        const Text(
                          'Deskripsi',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          hintText: 'Masukan Deskripsi',
                          maxLength: 3,
                          controller: controller.descController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "Deskripsi tidak boleh kosong.";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20,),

                        ///Upload Gambar
                        const Text(
                          "Upload Gambar",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.thirdColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            controller.uploadChoice(context);
                          },
                          child: SizedBox(
                            height: 171,
                            width: double.infinity,
                            child: controller.image != null ?
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child:
                              controller.image!.contains('http') ?
                              Image.network(
                                controller.image!,
                                errorBuilder: (context, url, error){
                                  return Image.asset("assets/upload_foto.png");
                                },
                                fit: BoxFit.cover,) :
                              Image.file(
                                File(controller.image!),
                                fit: BoxFit.cover,),
                            ) :
                            Image.asset("assets/upload_foto.png"),
                          ),
                        ),
                        const SizedBox(height: 34),

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
                                if(controller.selectedBarangData != null){
                                  controller.ubah();
                                } else {
                                  controller.tambah();
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
