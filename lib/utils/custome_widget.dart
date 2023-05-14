import 'package:flutter/material.dart';
import 'package:get/get.dart';

showNoInternetDialog(VoidCallback func) async {
  Get.dialog(
      AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("No Internet"),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red.shade50,
                child: const Icon(
                  Icons.signal_wifi_statusbar_connected_no_internet_4,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Make sure you are connected with internet."),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Get.back();
                    func();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text("Refresh"))
            ],
          ),
        ),
      ),
      barrierDismissible: false);
}

showExceptionDailog() async {
  Get.dialog(
      AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Technical Error"),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red.shade50,
                child: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Make sure you are connected with internet. Or Restart the app."),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Okay"))
            ],
          ),
        ),
      ),
      barrierDismissible: false);
}
