import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

class NotificationWidget extends StatelessWidget {
  final String username;
  final String message;
  final DateTime time;

  NotificationWidget(
      {required this.username, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColor.main,
        child: Text(username[0], style: TextStyle(color: AppColor.main)),
      ),
      title: Text(username),
      subtitle: Text(message),
      trailing: Text(_getTimeAgo(time)),
    );
  }

  String _getTimeAgo(DateTime time) {
    Duration difference = DateTime.now().difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}
