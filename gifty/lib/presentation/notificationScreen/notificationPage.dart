import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

import '../../widgets/notifications.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 242, 238, 1.0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    backgroundColor: AppColor.mainLighter,
                    foregroundColor: Color.fromRGBO(255, 242, 238, 1.0),
                  ),
                ),
                const Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.main,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.delete),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(2),
                    backgroundColor: AppColor.mainLighter,
                    foregroundColor: Color.fromRGBO(255, 242, 238, 1.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RawScrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NotificationWidget(
                      username: 'John Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 1)),
                    ),
                    NotificationWidget(
                      username: 'Jane Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 2)),
                    ),
                    NotificationWidget(
                      username: 'John Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 3)),
                    ),
                    NotificationWidget(
                      username: 'Jane Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 4)),
                    ),
                    NotificationWidget(
                      username: 'John Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 5)),
                    ),
                    NotificationWidget(
                      username: 'Jane Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 6)),
                    ),
                    NotificationWidget(
                      username: 'John Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 7)),
                    ),
                    NotificationWidget(
                      username: 'Jane Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 8)),
                    ),
                    NotificationWidget(
                      username: 'John Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 9)),
                    ),
                    NotificationWidget(
                      username: 'Jane Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 10)),
                    ),
                    NotificationWidget(
                      username: 'John Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      time: DateTime.now().subtract(Duration(days: 11)),
                    ),
                    NotificationWidget(
                      username: 'Jane Doe',
                      message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      time: DateTime.now().subtract(Duration(days: 11)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
