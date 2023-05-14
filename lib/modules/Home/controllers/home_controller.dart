import 'package:get/get.dart';
import 'package:stackoverflow/data/models/articals_data_model.dart';
import 'package:stackoverflow/services/api_service.dart';

import '../../../utils/custome_widget.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  int pageNo = 1;
  ArticalsDataModel articals = ArticalsDataModel(
      items: [], hasMore: false, quotaMax: 0, quotaRemaining: 0);

  @override
  void onInit() async {
    super.onInit();
    await fetchArticalsData();
  }

  fetchArticalsData({bool isPrev = false, bool isRefresh = false}) async {
    if (!isRefresh) {
      if (isPrev) {
        pageNo -= 1;
      } else {
        pageNo += 1;
      }
    }
    try {
      final response = await ApiService().getRequest(API_URLS.baseUrl(pageNo));
      articals = ArticalsDataModel.fromJson(response!.body);
    } catch (e) {
      showExceptionDailog();
    } finally {
      isLoading.value = false;
    }
    update();
  }
}
