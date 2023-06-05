import 'package:flutter/material.dart';

class ScanningAnimation extends StatefulWidget {
  final bool isScanning;

  const ScanningAnimation({super.key, required this.isScanning});

  @override
  _ScanningAnimationState createState() => _ScanningAnimationState();
}

class _ScanningAnimationState extends State<ScanningAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          if (widget.isScanning) {
            _animationController.forward();
          }
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ScanningAnimation oldWidget) {
    if (widget.isScanning != oldWidget.isScanning) {
      if (widget.isScanning) {
        _animationController.forward();
      } else {
        _animationController.stop();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        const double cardWidth = 360;
        const double cardHeight = 200;
        const double rectangleHeight = 100;
        final double scanningPosition =
            _animation.value * (cardHeight - rectangleHeight);

        return Positioned(
          top: scanningPosition,
          child: Container(
            width: cardWidth,
            height: rectangleHeight,
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            // color: Colors.white.withOpacity(0.5),
            color: const Color.fromARGB(255, 129, 121, 121).withOpacity(0.5),
          ),
        );
      },
    );
  }
}
