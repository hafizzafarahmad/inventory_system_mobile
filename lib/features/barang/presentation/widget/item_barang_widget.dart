import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inventory_system/core/helper/format_currency.dart';
import 'package:inventory_system/core/network/api_endpoint.dart';
import 'package:inventory_system/features/barang/data/model/barang_model.dart';
import 'package:inventory_system/features/barang/presentation/controller/barang_controller.dart';
import 'package:inventory_system/features/user/data/model/user_model.dart';
import 'package:inventory_system/features/user/presentation/controller/user_controller.dart';

import '../../../../core/style/app_color.dart';
import '../../../../core/style/shimmerline.dart';

class ItemBarangWidget extends StatelessWidget{
  final int index;
  final BarangData data;
  final BarangController controller;

  const ItemBarangWidget({Key? key, required this.index, required this.data, required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                  height: 60,
                  width: 60,
                  imageUrl: 'http://192.168.18.16:8000/images/item${data.pictureName!}',
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  httpHeaders: {
                    "Authorization": "Bearer ${controller.token}",
                    "Content-Type": "image/*"
                  },
                  placeholder: (context, url) =>
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColor.textFieldFilled
                        ),
                        child: const Icon(Icons.image_outlined, size: 30, color: AppColor.thirdColor40,),
                      ),
                  errorWidget: (context, url, error) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: AppColor.textFieldFilled
                      ),
                      child: const Icon(Icons.image_outlined, size: 30, color: AppColor.thirdColor40,),
                    );
                  })
            ),
           const SizedBox(width: 15,),
           Expanded(
             child:  Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     Expanded(
                       flex: 8,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             '${data.itemName}',
                             overflow: TextOverflow.ellipsis,
                             style: const TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.bold
                             ),
                           ),
                           const SizedBox(height: 3,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 '${formattedCurrency(data.price?.split(".").first)}/${data.uom}',
                                 style: const TextStyle(
                                   fontSize: 11,
                                 ),
                               ),
                               Text(
                                 'Stok: ${formattedCurrency(data.iStock!.quantity?.split(".").first)}',
                                 style: const TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.deepOrange
                                 ),
                               ),
                             ],
                           )
                         ],
                       )
                     ),
                     Expanded(
                       flex: 1,
                       child: PopupMenuButton<int>(
                         itemBuilder: (context) => [
                           PopupMenuItem(
                             value: 0,
                             child: Row(
                               children: const <Widget>[
                                 Icon(Icons.info_outline_rounded, size: 18, ),
                                 SizedBox(width: 5,),
                                 Text(
                                   "Detail",
                                   style: TextStyle(
                                       color: Colors.black),
                                 ),
                               ],
                             ),
                           ),
                           PopupMenuItem(
                             value: 1,
                             child: Row(
                               children: const <Widget>[
                                 Icon(Icons.edit, size: 18, ),
                                 SizedBox(width: 5,),
                                 Text(
                                   "Ubah",
                                   style: TextStyle(
                                       color: Colors.black),
                                 ),
                               ],
                             ),
                           ),
                           PopupMenuItem(
                             value: 2,
                             child: Row(
                               children: const <Widget>[
                                 Icon(Icons.delete_outline, size: 18, color: Colors.red),
                                 SizedBox(width: 5,),
                                 Text(
                                   "Hapus",
                                   style: TextStyle(
                                       color: Colors.red
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10.0)
                         ),
                         icon: const Icon(Icons.more_vert, size: 18, ),
                         offset: const Offset(0, 0),
                         onSelected: (value){
                           if(value == 0){

                           } else if (value == 1){
                             controller.selectedBarangData = data;
                             controller.goToUpdateUser();
                           } else {
                             controller.deleteUser(id: data.id.toString());
                           }
                         },
                       ),
                     )
                   ],
                 ),
               ],
             ),
           )
          ],
        ),
        const SizedBox(height: 10,),
        const Divider(thickness: 1,)
      ],
    );
  }

}