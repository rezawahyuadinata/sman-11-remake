import 'package:flutter/material.dart';

class LayoutPageBody extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  LayoutPageBody(
      {super.key, required this.mobileBody, required this.desktopBody});

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

class LayoutPageHeader extends StatelessWidget {
  final Widget mobileHead;
  final Widget desktopHead;
  LayoutPageHeader(
      {super.key, required this.mobileHead, required this.desktopHead});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          return mobileHead;
        } else {
          return desktopHead;
        }
      },
    );
  }
}
