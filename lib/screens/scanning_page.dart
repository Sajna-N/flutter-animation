// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' show get;
// import 'package:path_provider/path_provider.dart';
// import 'package:scan_card/animation/scanning_animation.dart';

// class ScanningPage extends StatefulWidget {
//   const ScanningPage({Key? key}) : super(key: key);

//   @override
//   State<ScanningPage> createState() => _ScanningPageState();
// }

// class _ScanningPageState extends State<ScanningPage> {
//   String? imageData;

//   @override
//   void initState() {
//     super.initState();
//     _downloadAndSavePhoto();
//   }

//   Future<void> _downloadAndSavePhoto() async {
//     var url =
//         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg";
//     var response = await get(Uri.parse(url));

//     var documentDirectory = await getApplicationDocumentsDirectory();
//     // var firstPath = "${documentDirectory.path}/images";
//     var firstPath = "${documentDirectory.path}/images";
//     await Directory(firstPath).create(recursive: true);

//     var filePathAndName = '$firstPath/pic.jpg';
//     File file = File(filePathAndName);
//     await file.writeAsBytes(response.bodyBytes);

//     setState(() {
//       imageData = filePathAndName;
//     });
//   }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:scan_card/animation/scanning_animation.dart';
// import 'package:scan_card/bloc/scanning_page_bloc.dart';
// import 'package:scan_card/bloc/scanning_page_event.dart';
// import 'package:scan_card/bloc/scanning_page_state.dart';

// class ScanningPage extends StatefulWidget {
//   const ScanningPage({Key? key}) : super(key: key);

//   @override
//   State<ScanningPage> createState() => _ScanningPageState();
// }

// class _ScanningPageState extends State<ScanningPage> {
//   late ScanningPageBloc _scanningPageBloc;

//   @override
//   void initState() {
//     super.initState();
//     _scanningPageBloc = ScanningPageBloc()..add(DownloadPhotoEvent());
//   }

//   @override
//   void dispose() {
//     _scanningPageBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ScanningPageBloc, ScanningPageState>(
//       bloc: _scanningPageBloc,
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("Scanning Card"),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 if (state.imageData != null)
//                   ScanningAnimation(
//                     duration: const Duration(seconds: 5),
//                     bgImage: state.imageData!,
//                     color: Colors.yellow,
//                   ),
//                 if (state.imageData == null) const CircularProgressIndicator(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_card/animation/scanning_animation.dart';
import 'package:scan_card/bloc/scanning_page_bloc.dart';
import 'package:scan_card/bloc/scanning_page_event.dart';
import 'package:scan_card/bloc/scanning_page_state.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  State<ScanningPage> createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  late ScanningPageBloc _scanningPageBloc;

  @override
  void initState() {
    super.initState();
    _scanningPageBloc = ScanningPageBloc();
    _scanningPageBloc.add(LoadPhotoEvent());
  }

  @override
  void dispose() {
    _scanningPageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanningPageBloc, ScanningPageState>(
      bloc: _scanningPageBloc,
      builder: (context, state) {
        print(state);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Scanning Card"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (state.imageData != null)
                  ScanningAnimation(
                    duration: const Duration(seconds: 5),
                    bgImage: state.imageData!,
                    color: Colors.yellow,
                  ),
                if (state.imageData == null && state.error == null)
                  const CircularProgressIndicator(),
                if (state.error != null)
                  Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
