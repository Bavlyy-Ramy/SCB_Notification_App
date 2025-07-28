import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const route = '/notification-screen';

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text('SCB Notification Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${message.notification?.title}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${message.notification?.body}',
              style: TextStyle(fontSize: 20),
            ),
            Text('${message.data}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
