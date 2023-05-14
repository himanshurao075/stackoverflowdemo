import 'package:get/get.dart';
import 'package:stackoverflow/modules/Home/controllers/home_controller.dart';
import 'package:stackoverflow/services/api_service.dart';
import 'package:stackoverflow/services/connectivity_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityService>(
      ConnectivityService(),
    );
    Get.lazyPut<ApiService>(
      () => ApiService(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
