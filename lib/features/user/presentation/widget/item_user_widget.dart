import 'package:flutter/material.dart';
import 'package:inventory_system/features/user/domain/model/user_model.dart';
import 'package:inventory_system/features/user/presentation/controller/user_controller.dart';

import '../../../../core/style/app_color.dart';
import '../../../../core/style/shimmerline.dart';

class ItemUserWidget extends StatelessWidget{
  final int index;
  final UserData data;
  final UserController controller;

  const ItemUserWidget({Key? key, required this.index, required this.data, required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  // border: Border.all(color: Colors.black38),
                  color: AppColor.textFieldFilled
              ),
              child: const Icon(Icons.person_outline, size: 40, color: AppColor.thirdColor40,),
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
                           Wrap(
                             alignment: WrapAlignment.center,
                             children: List.generate(data.roles?.length ?? 0, (index){
                               return  Container(
                                   margin: const EdgeInsets.only(bottom: 5),
                                   width: 70,
                                   padding: const EdgeInsets.symmetric( vertical: 1),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(5),
                                     color: Colors.green,
                                   ),
                                   child: Center(child: Text(
                                     data.roles![index].displayName!,
                                     style: const TextStyle(
                                         fontSize: 12,
                                         color: Colors.white,
                                         fontFamily: 'PoppinsMedium'
                                     ),
                                     textAlign: TextAlign.center,
                                   ),)
                               );
                             }
                             ),
                           ),
                           Text(
                             '${data.firstName} ${data.lastName}',
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             style: const TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.bold
                             ),
                           ),
                           const SizedBox(height: 3,),
                           Text(
                             '${data.email}',
                             style: const TextStyle(
                               fontSize: 11,
                             ),
                           ),
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
                             controller.selectedUserData = data;
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