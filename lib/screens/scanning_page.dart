import 'package:flutter/material.dart';
import 'package:scan_card/animation/scanning_animation.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  _ScanningPageState createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (_isScanning) {
          _animationController.forward();
        }
      }
    });
    _animationController.forward();
    _isScanning = true;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                  margin: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                  child: Image.asset(
                    'assets/images/logg.PNG',
                    // fit: BoxFit.cover,
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: _animationController,
                    builder: (context, snapshot, _) {
                      return ScanningAnimation(
                        isScanning: _isScanning,
                        animationController: _animationController,
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
