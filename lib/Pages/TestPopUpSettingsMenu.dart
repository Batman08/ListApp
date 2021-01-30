import 'package:flutter/material.dart';

class SettingsMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingsMenuState();
  }
}

class SettingsMenuState extends State<SettingsMenu> {
  Future<void> updateUI() async {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StringHelpers.appTitle"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: new TextStyle(fontSize: 45.0),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                  AlertDialog(
                  title: Text("Settings"),
                  content: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.settings),
                          labelText: "username",
                        ),
                      ),
                    ],
                  ),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('More Info'),
              onTap: () {
                /*    showAboutDialog(context: context, applicationIcon: FlutterLogo(),
                applicationName: "Simple List",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "Simple note taking app where you can place all your thoughts"
                );
                Navigator.pop(context);*/
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: AlertDialog(
          title: Text('Reset settings?'),
          content: Text('This will reset your device to its default factory settings.'),
          actions: [
            FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () {},
              child: Text('CANCEL'),
            ),
            FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () {},
              child: Text('ACCEPT'),
            ),
          ],
        )
      ),
    );

  }
}
