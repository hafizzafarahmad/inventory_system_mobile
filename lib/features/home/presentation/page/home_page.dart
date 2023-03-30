import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:inventory_system/common/widgets/dialog_to_confirm.dart';
import 'package:inventory_system/core/helper/scroll_behavior.dart';
import 'package:inventory_system/core/route/route_constant.dart';
import 'package:inventory_system/core/style/size_apps.dart';
import 'package:inventory_system/features/home/presentation/controller/home_controller.dart';
import '../../../../core/helper/format_currency.dart';
import '../../../../core/style/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (HomeController controller) {
        return Scaffold(
          body: ScrollConfiguration(
            behavior: MyScrollBehavior(),
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Container(height: SizeApps.height(context, size: 1), color: AppColor.whiteBackgroundInput,),
                    //Header Name
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: SizeApps.height(context, size: 0.055)),
                      height: SizeApps.height(context, size: 0.27),
                      width: SizeApps.width(context, size: 1),
                      decoration: const BoxDecoration(
                          color: AppColor.mainColor
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  // controller.goToProfile();
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: SizeApps.width(context, size: 0.1),
                                      width: SizeApps.width(context, size: 0.1),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100.0),
                                          child: Image.asset(
                                            'assets/no_profile.png',
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                    ),
                                    const SizedBox(width: 8,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.name ?? '-',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: SizeApps.width(context, size: 0.04)
                                          ),
                                        ),
                                        Text(
                                          controller.email ?? '-',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: SizeApps.width(context, size: 0.03)
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              InkWell(
                                onTap: (){
                                  dialogToConfirm(context, message: 'Logout', onTap: (){
                                    controller.logout();
                                  });
                                },
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: SizeApps.width(context, size: 0.05),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  margin: const EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.style4,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox(
                                              height: SizeApps.height(context, size: 0.09),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Jumlah Barang",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: SizeApps.width(context, size: 0.028),
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Text(
                                                    formattedCurrency(controller.jmlBarang.toString()),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: SizeApps.width(context, size: 0.06),
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  margin: const EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.style5,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox(
                                              height: SizeApps.height(context, size: 0.09),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Stok Hampir Habis",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: SizeApps.width(context, size: 0.028),
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Text(
                                                    formattedCurrency(controller.jmlStokHampirHabis.toString()),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: SizeApps.width(context, size: 0.06),
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  margin: const EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.style2,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox(
                                              height: SizeApps.height(context, size: 0.09),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Stok Habis",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: SizeApps.width(context, size: 0.028),
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Text(
                                                    formattedCurrency(controller.jmlStokHabis.toString()),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: SizeApps.width(context, size: 0.06),
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: SizeApps.height(context, size: 0.29)),
                      height: SizeApps.height(context, size: 0.73),
                      width: SizeApps.width(context, size: 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child:
                      GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                        itemBuilder: (_, index) => Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              controller.goToMenu(controller.menu[index].key);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 8,
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Icon(
                                          controller.menu[index].icon,
                                          color: controller.color[index],
                                          size: SizeApps.width(context, size: 0.2),
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          controller.menu[index].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: SizeApps.width(context, size: 0.037),
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: controller.menu.length,
                      )


                    ),
                  ],
                )
            ),
          )
        );
      },
    );
  }
}
