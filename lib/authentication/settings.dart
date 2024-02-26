import 'package:flutter/material.dart';

import 'change_mpin.dart';

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 28.0,
            color: Colors.white
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SettingsList(),

    );
  }
}

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SettingsListItem(
          title: 'Change MPIN',
          icon: Icons.lock,
          onPressed: () {

            // Navigate to the screen where user can change MPIN
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangeMpin(mobile:"1234")),
            );
          },
        ),
        // Add more list tiles for other settings as needed
      ],
    );
  }
}

class SettingsListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;

  const SettingsListItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 30.0,
              color: Colors.black,
            ),
            SizedBox(width: 20.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeMPINPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change MPIN',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 28.0,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter New MPIN',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'New MPIN',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm New MPIN',
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to change MPIN
                },
                child: Text('Change MPIN'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
