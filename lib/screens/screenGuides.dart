import 'package:flutter/material.dart';

import '../constants.dart';
import '../objects.dart';
import '../widgets.dart';

class GuidesScreen extends StatefulWidget {
  static const String routeName = '/guides';

  @override
  _GuidesScreenState createState() => _GuidesScreenState();
}

class _GuidesScreenState extends State<GuidesScreen> {
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
        appBar: const MainBar(title: "Ausflüge & Local guide"),
        body: Container(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Text("Erkunde die Gegend",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Center(
                child: Text(
                    "Guides für die lokale Gegend mit Tipps zu jeder Kategorie.",
                    style: subheadingStyle)),
            Flexible(child: LocalGuidesList())
          ]),
        )),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => createEntry(),
        //   backgroundColor: Colors.green,
        //   child: Icon(Icons.add),
        // ),
        drawer: MainDrawer(user: User()));
  }
}
