import 'dart:developer';

import 'package:flutter/material.dart';

var widht;

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  ResponsiveLayout({
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        widht = constraints.maxWidth;
        log("ASdd ${constraints.maxWidth}");
        if (constraints.maxWidth < 500) {
          log("mobileBody");
          return mobileBody;
        } else if (constraints.maxWidth < 1100) {
          log("tabletBody");
          return tabletBody;
        } else {
          log("desktopBody");

          return desktopBody;
        }
      },
    );
  }
}
