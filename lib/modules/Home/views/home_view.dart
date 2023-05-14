import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Stack Overflow"),
        ),
        persistentFooterButtons: [
          Text("Max Quota: ${controller.articals.quotaMax}  | "),
          Text("Quota Remaining: ${controller.articals.quotaRemaining}  | "),
          if (controller.pageNo > 1)
            TextButton.icon(
                onPressed: () {
                  controller.fetchArticalsData(isPrev: true);
                },
                icon: const Icon(Icons.skip_previous_outlined),
                label: const Text('Prev')),
          Text("Page ${controller.pageNo}"),
          if (controller.articals.hasMore)
            TextButton.icon(
                onPressed: () {
                  controller.fetchArticalsData();
                },
                icon: const Icon(Icons.skip_next_outlined),
                label: const Text('Next'))
        ],
        body: controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: controller.articals.items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = controller.articals.items[index];
                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Text(
                                    item.score.toString(),
                                    textScaleFactor: 2,
                                  ),
                                  const Text("Score")
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 17,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            "Artical Type : ${item.articleType}")
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${item.title}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textScaleFactor: 1.2,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 5,
                                      children: [
                                        Text(
                                          "Created: ${parseDate(item.creationDate)}",
                                          style: const TextStyle(
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          "Active: ${parseDate(item.lastActivityDate)}",
                                          style: const TextStyle(
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          "Last Edited: ${parseDate(item.lastEditDate)}",
                                          style: const TextStyle(
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          "Viewed: ${item.viewCount} times",
                                          style: const TextStyle(
                                              color: Colors.blueGrey),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Wrap(
                                      children: List.generate(
                                          item.tags.length,
                                          (index) => Container(
                                              margin: const EdgeInsets.all(2),
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: Colors.blue.shade50),
                                              child: Text(item.tags[index]))),
                                    ),
                                    const Divider(),
                                    Text(
                                      item.owner!.displayName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textScaleFactor: 1.05,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  item.owner!.profileImage)),
                                        ),
                                        Expanded(
                                            flex: 8,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Type: ${item.owner!.userType}"),
                                                  Text(
                                                      "User id: ${item.owner!.userId}"),
                                                  Text(
                                                      "Reputation: ${item.owner!.reputation}"),
                                                  Text(
                                                      "Account Id: ${item.owner!.accountId}"),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                    SelectableText(
                                      "Profile Url:  ${item.owner!.link}",
                                      style: const TextStyle(color: Colors.blue),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      );
    });
  }

  String parseDate(int timeStamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(1683761148 * 1000);
    print(date);
    final c = DateTime.now().difference(date);
    final t = c.inDays;
    return "$t days ago";
  }
}
