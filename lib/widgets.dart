import 'package:flutter/material.dart';
import 'package:helloworld/routes.dart';

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
              title: const Text("Sauna & Whirlpool"),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.wellness);
                // Then close the drawer
                // Navigator.pop(context);
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
