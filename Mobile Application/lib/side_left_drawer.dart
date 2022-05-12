
import 'package:flutter/material.dart';
import 'package:mobile_app/side_bar_ menu_list.dart';
import 'package:flutter_session/flutter_session.dart';


class leftDrawerMenu extends StatefulWidget {
  const leftDrawerMenu({Key? key}) : super(key: key);

  @override
  _leftDrawerMenuState createState() => _leftDrawerMenuState();
}

class _leftDrawerMenuState extends State<leftDrawerMenu> {

  @override
  Widget build(BuildContext context) {


    Future change_Number() async {
      dynamic token = await FlutterSession().get("data");

    }
    return Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
        currentAccountPicture: Icon(
          Icons.face,
          size: 48.0,
          color: Colors.black,
        ),
      accountName: Text('Mary Domfeh'),
      accountEmail: Text("domfeh@gmail.com"),
      otherAccountsPictures: <Widget>[
      Icon( Icons.bookmark_border, color: Colors.white,
      ) ],
      decoration:
      BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/profile.png'),
        fit: BoxFit.cover, ),
      ),
    ),

            const sideBarMenuList(),
          ],
      ),
    );
  }
}
