import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.amber)),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    // Konfigurasi untuk Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Konfigurasi untuk iOS
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    // Gabungkan pengaturan
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    // Inisialisasi plugin notifikasi
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  // Fungsi ketika notifikasi diklik
  void onSelectNotification(NotificationResponse response) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => NewScreen(payload: response.payload ?? 'No payload'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Flutter Notification Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: showNotification,
          child: const Text('Show Notification'),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan notifikasi
  Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'id',
          'channel',
          importance: Importance.max,
          priority: Priority.high,
        );

    const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails();

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Flutter Notification',
      'Demo Notification',
      platformDetails,
      payload: 'Welcome to the Local Notification demo',
    );
  }
}

// Halaman yang akan dibuka setelah notifikasi diklik
class NewScreen extends StatelessWidget {
  final String payload;

  const NewScreen({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(payload)),
      body: Center(
        child: Text('Payload: $payload', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
