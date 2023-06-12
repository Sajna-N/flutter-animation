// import 'package:flutter/material.dart';
// import 'package:scan_card/screens/scanning_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Scanning Card',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ScanningPage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_card/bloc/scanning_page_bloc.dart';
import 'package:scan_card/screens/scanning_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late ScanningPageBloc scanningPageBloc;

  @override
  void initState() {
    super.initState();
    scanningPageBloc = ScanningPageBloc();
  }

  @override
  void dispose() {
    scanningPageBloc.close(); // Close the bloc when the app is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan Card',
      home: BlocProvider<ScanningPageBloc>(
        create: (context) => scanningPageBloc,
        child: const ScanningPage(),
      ),
    );
  }
}
