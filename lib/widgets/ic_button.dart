import 'package:flutter/material.dart';

class IcButton extends StatelessWidget {
  IcButton(
      {required this.theColor,
      required this.theIconData,
      required this.theOnPressedFunc});

  final Color theColor;
  final IconData theIconData;
  final VoidCallback theOnPressedFunc;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(theIconData),
      onPressed: theOnPressedFunc,
      constraints: const BoxConstraints.tightFor(
        width: 44.0,
        height: 44.0,
      ),
      shape: const CircleBorder(),
      fillColor: theColor,
    );
  }
}
