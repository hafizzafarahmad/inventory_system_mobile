import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_system/features/barang/presentation/controller/barang_controller.dart';
import 'package:inventory_system/features/transaksi/presentation/controller/transaksi_controller.dart';
import 'package:inventory_system/features/user/presentation/controller/user_controller.dart';

import '../../../../../core/style/app_color.dart';
import '../../../../common/widgets/ErrorNoDataPage.dart';
import '../../../../core/style/shimmerline.dart';
import '../../../../core/style/size_apps.dart';
import '../../../../dependency_injection.dart';
import '../widget/item_transaksi_widget.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiController>(
      init: TransaksiController(transaksiRepository: sl()),
      builder: (TransaksiController controller) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: AppColor.mainColor,
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Transaksi Barang', style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14
                ),),
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                bottom: const TabBar(
                  labelColor: AppColor.mainColor,
                  indicatorColor: AppColor.mainColor,
                  unselectedLabelColor: Colors.black45,
                  isScrollable: false,
                  tabs: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Barang Masuk"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Barang Keluar"),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                  children: controller.tabs.map((Tab tab) {
                    // print(tab);
                    if (tab.text == "Barang Masuk") {
                      return Scaffold(
                        body: RefreshIndicator(
                          onRefresh: (){
                            return controller.onRefresh();
                          },
                          child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child:
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: controller.listIn.isEmpty && !controller.isLoading ?
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
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        itemCount: controller.listIn.length,
                                        itemBuilder: (context, i){
                                          return ItemTransaksiWidget(index: i,
                                            data: controller.listIn[i],
                                            controller: controller, type: 'in',
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
                              controller.goToOpenScanner(context, 'in');
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
                    }
                    else if(tab.text == "Barang Keluar") {
                      return Scaffold(
                        body: RefreshIndicator(
                          onRefresh: (){
                            return controller.onRefresh();
                          },
                          child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child:
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: controller.listOut.isEmpty && !controller.isLoading ?
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
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        addAutomaticKeepAlives: true,
                                        itemCount: controller.listOut.length,
                                        itemBuilder: (context, i){
                                          return ItemTransaksiWidget(index: i,
                                            data: controller.listOut[i],
                                            controller: controller, type: 'out',
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
                              controller.goToOpenScanner(context, 'out');
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 15, right: 15, top:13, bottom: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(Icons.remove, color: Colors.white, size: 30,),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }).toList()),
            ));
      },
    );
  }
}
