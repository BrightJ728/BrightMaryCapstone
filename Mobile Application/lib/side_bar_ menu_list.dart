import 'package:flutter/material.dart';
import 'package:mobile_app/addUser.dart';
import 'package:mobile_app/changePassword.dart';
import 'package:mobile_app/logOut.dart';
import 'package:mobile_app/viewAllUsers.dart';
import 'package:mobile_app/HomePage.dart';
import 'package:mobile_app/notificationPreferences.dart';

class sideBarMenuList extends StatefulWidget {
  const sideBarMenuList({Key? key}) : super(key: key);

  @override
  _sideBarMenuListState createState() => _sideBarMenuListState();
}

class _sideBarMenuListState extends State<sideBarMenuList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.person_add),
          title: Text('Add Other users to be notified '),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewUsers(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Change Phone Number'),
          onTap: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) => Notifications(),
            );

          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('View  all notified persons'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewAllUsers(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.password),
          title: Text('Change Password'),
          onTap: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) => changePassword(),
            );
          },
        ),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Log Out'),
          onTap: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) => logOut(),
            );

          },
        ),
      ],
    );
  }
}
