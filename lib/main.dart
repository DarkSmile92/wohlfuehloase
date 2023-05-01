import 'package:flutter/material.dart';

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
      // you want
      theme: ThemeData(primarySwatch: Colors.brown),
      // A widget which will be started on application startup
      home: HomePage(title: 'Wohlfühloase'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(
        child: Text(
          'Ankommen. Loslassen. Entspannen.',
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 241, 238, 238),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child:
                  Text("Wohlfühloase", style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                  color: Colors.brown,
                  image: DecorationImage(
                      image: AssetImage('images/drawer-cover.png'),
                      fit: BoxFit.cover)),
            ),
            ListTile(
                title: const Text("Sauna & Whirlpool"),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text("Kursraum"),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text("Ausflüge & Local guide"),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text("AddOns"),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text("Kontakt"),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
