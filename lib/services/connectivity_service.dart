import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../utils/custome_widget.dart';

class ConnectivityService extends GetxService {
  RxBool hasConnection = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
    Connectivity().onConnectivityChanged.listen((result) {
      checkConnectivity();
    });
  }

  Future<void> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    hasConnection.value = connectivityResult != ConnectivityResult.none;
    if (!hasConnection.value) {
      showNoInternetDialog(() {
        checkConnectivity();
      });
    }
  }
}
