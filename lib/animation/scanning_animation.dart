import 'dart:io';

import 'package:flutter/material.dart';

class ScanningAnimation extends StatefulWidget {
  final Duration duration;
  final String bgImage;
  final Color color;

  const ScanningAnimation({
    Key? key,
    required this.duration,
    required this.bgImage,
    required this.color,
  }) : super(key: key);

  @override
  ScanningAnimationState createState() => ScanningAnimationState();
}

class ScanningAnimationState extends State<ScanningAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width - 50;
    double imageHeight = MediaQuery.of(context).size.height / 4;
    double cardHeight = imageHeight + 120;
    double rectangleHeight = imageHeight + 30;

    return Stack(children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // elevation: 4,
        margin: const EdgeInsets.fromLTRB(30, 60, 30, 60),
        child: Image.file(
          File(widget.bgImage),
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final double scanningPosition =
                _animation.value * (cardHeight - rectangleHeight);

            return Container(
              width: imageWidth + 50,
              height: rectangleHeight,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.3),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 221, 183, 13),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              transform: Matrix4.translationValues(0, scanningPosition, 0),
            );
          },
        ),
      )
    ]);
  }
}
