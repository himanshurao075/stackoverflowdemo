import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import 'connectivity_service.dart';

class ApiService extends GetConnect {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    connect = Get.put(GetConnect());
  }

  late GetConnect connect;
  final ConnectivityService connectivityService =
      Get.find<ConnectivityService>();

  //GET request example
  Future<Response?> getRequest(String url) async {
    Response response = await connect.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  //post request example
  Future<Response?> postRequest(
      String url, Map<String, dynamic> jsonBody) async {
    //body data
    // FormData formData = FormData(jsonBody);

    Response response = await connect.post(url, jsonBody);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}

abstract class API_URLS {
  API_URLS._();
  static baseUrl(int pageNo) =>
      'https://api.stackexchange.com/2.3/articles?page=${pageNo}&pagesize=10&order=desc&sort=activity&site=stackoverflow';
}
