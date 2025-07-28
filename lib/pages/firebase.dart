import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _token;

  @override
  void initState() {
    super.initState();

    // Get FCM token
    FirebaseMessaging.instance.getToken().then((token) {
      log('🔑 FCM Token: $token');
      setState(() => _token = token);
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('📬 Foreground message: ${message.notification?.title}');
    });

    // Handle notification clicks when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('🚀 Notification clicked: ${message.data}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("SCB Notification")),
        body: Center(
          child: SelectableText(_token ?? "Getting FCM Token..."),
        ),
      ),
    );
  }
}
