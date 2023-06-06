import 'package:flutter/material.dart';

class ScanningAnimation extends StatefulWidget {
  final bool isScanning;
  final AnimationController animationController;

  const ScanningAnimation({
    Key? key,
    required this.isScanning,
    required this.animationController,
  }) : super(key: key);

  @override
  _ScanningAnimationState createState() => _ScanningAnimationState();
}

class _ScanningAnimationState extends State<ScanningAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation =
        Tween<double>(begin: 0, end: 1).animate(widget.animationController);
    widget.animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 360;
    const double cardHeight = 280;
    const double rectangleHeight = 180;
    final double scanningPosition =
        _animation.value * (cardHeight - rectangleHeight);

    return Positioned(
      top: scanningPosition,
      child: Container(
        width: cardWidth,
        height: rectangleHeight,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 185, 135).withOpacity(0.3),
          border: Border.all(
              width: 2, color: const Color.fromARGB(255, 221, 183, 13)),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      ),
    );
  }
}
