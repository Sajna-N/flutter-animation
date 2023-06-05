import 'package:flutter/material.dart';
import 'package:scan_card/screens/scanning_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanning Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScanningPage(),
    );
  }
}
