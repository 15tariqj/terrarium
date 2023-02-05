import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation(
      {Key? key,
        required this.child,
        this.yOffset = 0.3,
        required this.startInterval,
        required this.endInterval,
        this.duration = 2000,
        this.xOffset = 0,
        this.endYOffset = 0,
        this.endXOffset = 0})
      : super(key: key);

  final Widget child;
  final int duration;

  final double yOffset;
  final double endYOffset;
  final double endXOffset;
  final double xOffset;
  final double startInterval;
  final double endInterval;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(widget.xOffset, widget.yOffset),
        end: Offset(widget.endXOffset, widget.endYOffset),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(widget.startInterval, widget.endInterval, curve: Curves.easeOutCubic),
        ),
      ),
      child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Interval(widget.startInterval, widget.endInterval, curve: Curves.easeOutCubic),
            ),
          ),
          child: widget.child),
    );
  }
}

class OpacityAnimation extends StatefulWidget {
  OpacityAnimation({
    Key? key,
    required this.child,
    required this.startInterval,
    required this.endInterval,
    this.duration = 2000,
  }) : super(key: key);

  final double startInterval;
  final double endInterval;
  final Widget child;
  final int duration;

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(widget.startInterval, widget.endInterval, curve: Curves.easeOutCubic),
        ),
      ),
      child: widget.child,
    );
  }
}
