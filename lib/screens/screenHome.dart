import 'package:flutter/material.dart';

import '../constants.dart';
import '../objects.dart';
import '../widgets.dart';

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
