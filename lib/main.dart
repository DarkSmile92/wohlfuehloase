import 'package:flutter/material.dart';
import 'package:wohlfuehloase/routes.dart';
import 'package:wohlfuehloase/screens/screenHome.dart';
import 'package:wohlfuehloase/screens/screenWellness.dart';

import 'constants.dart';
import 'objects.dart';
import 'widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Wohlfühloase',
      // Application theme data, you can set the colors for the application as
      theme: ThemeData(primarySwatch: Colors.brown),
      // A widget which will be started on application startup
      home: HomePage(title: 'Wohlfühloase'),
      routes: {
        Routes.wellness: (context) => WellnessScreen(),
        Routes.home: (context) => HomePage(title: 'Wohlfühloase')
      },
    );
  }
}
