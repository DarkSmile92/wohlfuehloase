import 'package:flutter/material.dart';
import 'package:wohlfuehloase/routes.dart';
import 'package:wohlfuehloase/services.dart';

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
                Navigator.pushReplacementNamed(context, Routes.guides);
                // Then close the drawer
                // Navigator.pop(context);
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
      WellnessEntry("b", "Silvia & Peter", "01.05.2023 // 16:00 - 16:30")
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

class LocalGuidesList extends StatefulWidget {
  const LocalGuidesList({super.key});
  _LocalGuidesListState createState() => _LocalGuidesListState();
}

class _LocalGuidesListState extends State<LocalGuidesList> {
  // late Future<List<WellnessEntry>> _entries;
  List<GuideObj> _entries = [];
  bool _isLoading = true;
  final GuideService guideService = GuideService();

  Future<void> _loadGuides(BuildContext context) async {
    // Set _isLoading to true before making the request to show the loading spinner
    setState(() {
      _isLoading = true;
    });
    try {
      final List<dynamic> response = await guideService.getGuides();
      _entries = response.map((guide) => GuideObj.fromJson(guide)).toList();
      // print('Guides fetched successfully');
    } catch (error) {
      // print('Failed to load the guides: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to load guides. Error: $error'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    // Set _isLoading to false after the request is complete to rebuild the widget
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _loadGuides(context); // Now you have access to context
    });
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

  List<_LocalGuidesListItem> _buildItemList() {
    return _entries
        .map((entry) => new _LocalGuidesListItem(
            entry: entry,
            onTap: () {
              _showDetailsPage(context, entry);
            }))
        .toList();
  }

  void _showDetailsPage(BuildContext context, GuideObj entry) {
    // Navigator.push(context, new MaterialPageRoute<Null>(
    //   settings: const RouteSettings(name: ContactPage.routeName),
    //   builder: (BuildContext context) => new ContactPage(contact)
    // ));
    if (entry != null && !entry.entries.isEmpty) {
      final int noOfEntries = entry.entries.length;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$noOfEntries Einträge'),
            content: Text(entry.entries.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Keine Einträge'),
            content:
                Text('Sorry, hierfür haben wir noch keine Einträge gepflegt.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class _LocalGuidesListItem extends ListTile {
  _LocalGuidesListItem(
      {required GuideObj entry, required GestureTapCallback onTap})
      : super(
            title: Text(entry.title),
            subtitle: Text(entry.body),
            leading: CircleAvatar(child: Text(entry.title[0])),
            onTap: onTap);
}
