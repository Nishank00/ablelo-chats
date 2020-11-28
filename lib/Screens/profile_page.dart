import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3f7b82),
        leading: Icon(Icons.arrow_back),
        title: Text("Settings"),
        centerTitle: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
              ),
              title: Text("Nishank Sidhpura"),
              subtitle: Text("Busy"),
              trailing: Icon(Icons.qr_code),
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              leading: Icon(
                Icons.lock_open,
                size: 25,
              ),
              title: Text("Account"),
              subtitle: Text('Privacy, security, change number'),
            ),
            ListTile(
              leading: Icon(
                Icons.message,
                size: 25,
              ),
              title: Text("Chats"),
              subtitle: Text('Theme, wallpaper, chat history'),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                size: 25,
              ),
              title: Text("Notifications"),
              subtitle: Text('Message, group & call tones'),
            ),
            ListTile(
              leading: Icon(
                Icons.data_usage,
                size: 25,
              ),
              title: Text("Storage and data"),
              subtitle: Text('Network usage, auto-download'),
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                size: 25,
              ),
              title: Text("Help"),
              subtitle: Text('FAQ, contact us, privacy policy'),
            ),
            Divider(),
            Padding(padding: EdgeInsets.all(10)),
            ListTile(
              leading: Icon(
                Icons.person_add,
                size: 25,
              ),
              title: Text("Invite a Friend"),
              //subtitle: Text('FAQ, contact us, privacy policy'),
            ),
          ],
        ),
      )),
    );
  }
}
