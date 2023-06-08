import 'package:flutter/material.dart';
import 'package:scan_card/animation/scanning_animation.dart';

class ScanningPage extends StatelessWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanning Card"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            ScanningAnimation(
              duration: Duration(seconds: 5),
              bgImage: 'assets/images/logg.PNG',
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
