import 'package:flutter/material.dart';
import 'package:mobile_app/homePage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/main.dart';
import 'dart:convert';

var data;

class Notifications extends StatelessWidget {

  final TextEditingController _oldNumbercontrol = new TextEditingController();
  final TextEditingController _newNumbercontrol = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: const Text('Change Number'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              children: [

                // old phone number  text form field
                TextFormField(
                  controller: _oldNumbercontrol,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Enter your old Number",
                    contentPadding: EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),

                  ),
                ),

                SizedBox(height: 7,),

                // new phone number   text form field
                TextFormField(
                  controller: _newNumbercontrol,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Enter your new Phone Number",
                    contentPadding: EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),

                  ),
                ),

              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) => _builDialog(context),
            );
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('Save'),

        ),
      ],
    );
  }


  Widget _builDialog(BuildContext context) {
    Future change_number() async {
      dynamic token = await FlutterSession().get("data");
      var url = "http://20.90.108.172/Mobile/change_number.php";
      var response = await http.post(Uri.parse(url), body: {
        "oldNumber": _oldNumbercontrol.text,
        "newNumber": _newNumbercontrol.text,
        "Fs_email": token,

      });

      data = json.decode(response.body);
      if (data == "Error") {
        showDialog(
          context: context,
          builder: (BuildContext context) => _Dialog(context),
        );
       // Navigator.of(context).pop();
      }

      else {
        showDialog(
          context: context,
          builder: (BuildContext context) => _Dialog(context),
        );
       // Navigator.of(context).pop();
      }
    }


    return new AlertDialog(
      title: const Text('Confirmation'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Are you sure you want to change the phone Number? "),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
            change_number();


          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('Yes'),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
            change_number();

          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('No'),
        ),

      ],
    );
  }


  Widget _Dialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Change Phone Number status'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          Text("Phone Number  changed  " + data),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('Close'),
        ),

      ],
    );
  }
}