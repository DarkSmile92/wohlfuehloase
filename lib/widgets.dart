import 'package:flutter/material.dart';
import 'package:wohlfuehloase/routes.dart';

import 'objects.dart';

class MainBar extends StatelessWidget implements PreferredSizeWidget {
  const MainBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 32,
          ),
          Container(padding: const EdgeInsets.all(8.0), child: Text(title))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(60.0);
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 241, 238, 238),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text("Wohlfühloase", style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
                color: Colors.brown,
                image: DecorationImage(
                    image: AssetImage('images/drawer-cover.png'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: const Text("Start"),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              }),
          ListTile(
              leading: Icon(Icons.waves),
              title: const Text("Sauna & Whirlpool"),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.wellness);
                // Then close the drawer
                // Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.door_back_door),
              title: const Text("Kursraum"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.place),
              title: const Text("Ausflüge & Local guide"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.plus_one),
              title: const Text("AddOns"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.phone),
              title: const Text("Kontakt"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              }),
          // Divider(
          //   color: Colors.black,
          //   height: 1,
          //   thickness: 1,
          // )
          ListTile(
            title: const Text("v1.0.0", style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }
}

class WellnessList extends StatefulWidget {
  const WellnessList({super.key});
  _WellnessListState createState() => _WellnessListState();
}

class _WellnessListState extends State<WellnessList> {
  // late Future<List<WellnessEntry>> _entries;
  List<WellnessEntry> _entries = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _entries = [
      WellnessEntry("a", "Robin & Natalie", "01.05.2023 // 15:30 - 16:00"),
      WellnessEntry("a", "Silvia & Peter", "01.05.2023 // 16:00 - 16:30")
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
          child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: CircularProgressIndicator()));
    } else {
      if (_entries.isEmpty) {
        return Center(child: const Text("No data"));
      } else {
        return ListView(children: _buildItemList());
      }
    }
  }

  List<_WellnessListItem> _buildItemList() {
    return _entries
        .map((entry) => new _WellnessListItem(
            entry: entry,
            onTap: () {
              _showDetailsPage(context, entry);
            }))
        .toList();
  }

  void _showDetailsPage(BuildContext context, WellnessEntry entry) {
    // Navigator.push(context, new MaterialPageRoute<Null>(
    //   settings: const RouteSettings(name: ContactPage.routeName),
    //   builder: (BuildContext context) => new ContactPage(contact)
    // ));
  }
}

class _WellnessListItem extends ListTile {
  _WellnessListItem(
      {required WellnessEntry entry, required GestureTapCallback onTap})
      : super(
            title: Text(entry.name),
            subtitle: Text(entry.datetime),
            leading: CircleAvatar(child: Text(entry.name[0])),
            onTap: onTap);
}
