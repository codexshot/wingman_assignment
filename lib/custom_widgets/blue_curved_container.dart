import 'package:flutter/material.dart';

class BlueCurvedContainer extends StatelessWidget {
  final double height;
  final Widget child;

  const BlueCurvedContainer(
      {Key? key, required this.height, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 90.0)),
      ),
    );
  }
}
