import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/homePage.dart';

class logOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    backgroundColor: Colors.redAccent;
    return new AlertDialog(
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Are You sure you want to log out ? "),

        ],
      ),

      actions: <Widget>[
        new RaisedButton(
          onPressed: () {
            //Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WelcomePage()));
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('Yes'),
        ),

        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('Cancel'),
        ),

      ],
    );
  }
}

