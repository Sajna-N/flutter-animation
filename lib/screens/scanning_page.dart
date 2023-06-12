import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:path_provider/path_provider.dart';
import 'package:scan_card/animation/scanning_animation.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  State<ScanningPage> createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  String? imageData;

  @override
  void initState() {
    super.initState();
    _downloadAndSavePhoto();
  }

  Future<void> _downloadAndSavePhoto() async {
    var url =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg";
    var response = await get(Uri.parse(url));

    var documentDirectory = await getApplicationDocumentsDirectory();
    // var firstPath = "${documentDirectory.path}/images";
    var firstPath = "${documentDirectory.path}/images";
    await Directory(firstPath).create(recursive: true);

    var filePathAndName = '$firstPath/pic.jpg';
    File file = File(filePathAndName);
    await file.writeAsBytes(response.bodyBytes);

    setState(() {
      imageData = filePathAndName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanning Card"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (imageData != null)
              ScanningAnimation(
                duration: const Duration(seconds: 5),
                // bgImage: File(imageData!) as String,
                bgImage: imageData!,
                color: Colors.yellow,
              ),
            if (imageData == null) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
