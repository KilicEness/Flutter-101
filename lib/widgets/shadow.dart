import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  const ShadowWidget(
      {Key? key, required this.child, this.elevation, this.color})
      : super(key: key);
  final Widget child;
  final double? elevation;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: color ?? Colors.black,
      elevation: elevation ?? 10,
      child: child,
    );
  }
}
