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
            // Stack(
            //   children: [
            //     Card(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       elevation: 4,
            //       margin: const EdgeInsets.fromLTRB(30, 60, 30, 60),
            //       child: Image.asset(
            //         'assets/images/logg.PNG',
            //         // fit: BoxFit.cover,
            //       ),
            //     ),
            ScanningAnimation(
              duration: Duration(seconds: 5),
              bgImage: 'assets/images/logg.PNG',
              color: Colors.yellow,
            ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
