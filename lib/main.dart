import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stackoverflow/routes/app_pages.dart';
import 'package:stackoverflow/services/connectivity_service.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "stackoverflow",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
