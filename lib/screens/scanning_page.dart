import 'package:flutter/material.dart';
import 'package:scan_card/animation/scanning_animation.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({super.key});

  @override
  _ScanningPageState createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  bool _isScanning = false;

  void toggleScanning() {
    setState(() {
      _isScanning = !_isScanning;
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
            Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.all(40),
                  color: const Color.fromARGB(255, 105, 139, 156),
                  child: const ListTile(
                    contentPadding: EdgeInsets.all(8),
                    title: Text("Testing"),
                    subtitle: Text("Hii Check"),
                  ),
                ),
                ScanningAnimation(isScanning: _isScanning),
              ],
            ),
            // const Text("Scanning Card"),
            // const Text("Checking Demo"),
            TextButton(
              onPressed: toggleScanning,
              child: Text(_isScanning ? 'Stop Animation' : 'Start Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
