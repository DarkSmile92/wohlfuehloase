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

  void createEntry() async {
    // final String groupName = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => NewGroupDialog(),
    //     //fullscreenDialog: true,
    //   ),
    // );
    // if (groupName.length > 0) {
    //   context
    //       .read<GroupsService>()
    //       .addGroupIfNotExist(auth.currentUser!.uid, groupName);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainBar(title: "Sauna & Whirlpool"),
        body: Container(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Text("Buchung Sauna & Pool",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Center(
                child: Text("Wähle einen freien Slot aus und trage dich ein",
                    style: subheadingStyle)),
            Flexible(child: WellnessList())
          ]),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => createEntry(),
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
        ),
        drawer: MainDrawer(user: User()));
  }
}
