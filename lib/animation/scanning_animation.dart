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
    const double cardWidth = 360;
    const double cardHeight = 280;
    const double rectangleHeight = 180;

    return Stack(children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.fromLTRB(30, 60, 30, 60),
        child: Image.asset(
          widget.bgImage,
          // fit: BoxFit.cover,
        ),
      ),
      Positioned(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final double scanningPosition =
                _animation.value * (cardHeight - rectangleHeight);

            return Container(
              width: cardWidth,
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
