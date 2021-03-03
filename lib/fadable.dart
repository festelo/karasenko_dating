import 'package:flutter/material.dart';

class Fadable extends StatefulWidget {
  final Widget child;

  const Fadable({Key? key, required this.child}) : super(key: key);

  @override
  _FadableState createState() => _FadableState();
}

class _FadableState extends State<Fadable> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1600),
      lowerBound: 0.6,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: widget.child,
    );
  }
}
