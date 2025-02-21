import 'package:flutter/material.dart';
import 'portrait_view.dart';
import 'landscape_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ResponsiveListScreen());
  }
}

class ResponsiveListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check screen orientation using MediaQuery
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      // If the screen is in portrait mode
      return PortraitView();
    } else {
      // If the screen is in landscape mode
      return LandscapeView();
    }
  }
}
