import 'package:flutter/material.dart';
import 'package:sman11/landingpage.dart';
import 'package:sman11/layout.dart';

void main() => runApp(SmanSebelas());

class SmanSebelas extends StatelessWidget {
  const SmanSebelas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ResponsiveLayouts(),
      },
    );
  }
}
