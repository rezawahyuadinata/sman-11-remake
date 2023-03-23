import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  LayoutPage({super.key, required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
