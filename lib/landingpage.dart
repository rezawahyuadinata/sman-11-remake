import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sman11/layout.dart';
import 'package:sman11/mobile/main_mobile.dart';
import 'package:sman11/web/main_desktop.dart';

class ResponsiveLayouts extends StatefulWidget {
  const ResponsiveLayouts({super.key});

  @override
  State<ResponsiveLayouts> createState() => _ResponsiveLayoutsState();
}

class _ResponsiveLayoutsState extends State<ResponsiveLayouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: LayoutPageHeader(
          desktopHead: DesktopHomePageHeader(),
          mobileHead: DesktopHomePageHeader(),
        ),
      ),
      body: LayoutPageBody(
        mobileBody: MobileHomePage(),
        desktopBody: DesktopHomePageBody(),
      ),
    );
  }
}
