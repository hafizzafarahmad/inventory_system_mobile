import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/state_manager.dart';
import 'package:overlay_support/overlay_support.dart';

class ConnectivityController extends GetxController {
  var connectedToInternet = true.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      print("ini result $result");
      checkConnectivity(result);
    });
    ever(
      connectedToInternet,
      (_) {
        if (connectedToInternet.value == true) {
          return;
        } else {
          return toast("Are you connected to internet? $connectedToInternet");
        }
      },
    );
    super.onInit();
  }

  void checkConnectivity(ConnectivityResult result) async {
    if (result == ConnectivityResult.none ||
        result == ConnectivityResult.bluetooth) {
      print(result);
      connectedToInternet.value = false;
    } else {
      print(result);
      connectedToInternet.value = true;
    }
  }
}
