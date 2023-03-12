import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_system/features/user/presentation/controller/user_controller.dart';

import '../../../../../core/style/app_color.dart';
import '../../../../common/widgets/ErrorNoDataPage.dart';
import '../../../../core/style/shimmerline.dart';
import '../../../../core/style/size_apps.dart';
import '../../../../dependency_injection.dart';
import '../widget/item_user_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(userRepository: sl()),
      builder: (UserController controller) {
        return Scaffold(
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
            title: const Text(
              'Data User',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: (){
              return controller.onRefresh();
            },
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child:
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: controller.list.isEmpty && !controller.isLoading ?
                      Container(
                        height: SizeApps.height(context, size: 0.6),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: const ErrorNoDataPage(messages: 'Tidak ada data',),
                      ): Container(
                      padding: const EdgeInsets.only(bottom: 70, top: 10),
                      width: MediaQuery.of(context).size.width,
                      child: controller.isLoading ?
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          addAutomaticKeepAlives: true,
                          itemCount: 5,
                          itemBuilder: (context, i){
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: ShimmerLine(width: SizeApps.width(context, size: 1), height: 70),
                            );
                          }
                      ) :
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          addAutomaticKeepAlives: true,
                          itemCount: controller.list.length,
                          itemBuilder: (context, i){
                            return ItemUserWidget(index: i,
                              data: controller.list[i],
                              controller: controller,
                              );
                          }
                      )
                  ),
                )
            ),
          ),
          floatingActionButton: Card(
            color: AppColor.mainColor,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              onTap: (){
                controller.goToAddUser();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top:13, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 30,),
              ),
            ),
          ),
        );
      },
    );
  }
}
