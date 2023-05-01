import 'package:flutter/material.dart';

import 'constants.dart';
import 'objects.dart';
import 'widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainBar(title: appTitle),
      body: Center(
        child: Text(
          'Ankommen. Loslassen. Entspannen.',
        ),
      ),
      drawer: MainDrawer(user: User()),
    );
  }
}

class WellnessScreen extends StatefulWidget {
  static const String routeName = '/wellness';

  @override
  _WellnessScreenState createState() => _WellnessScreenState();
}

class _WellnessScreenState extends State<WellnessScreen> {
  final TextEditingController _txtCtrlName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainBar(title: "Sauna & Whirlpool"),
        body: Center(
          child: Text(
            'Ankommen. Loslassen. Entspannen.',
          ),
        ),
        drawer: MainDrawer(user: User()));
  }
}
