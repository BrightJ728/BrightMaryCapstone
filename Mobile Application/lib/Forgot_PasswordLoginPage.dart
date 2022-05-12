import 'package:flutter/material.dart';
import 'package:mobile_app/homePage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/main.dart';
import 'dart:convert';

var data;



class changePasswordLogin extends StatelessWidget {

  final TextEditingController _emailcontrol = new TextEditingController();
  final TextEditingController _newPasswordcontrol = new TextEditingController();

  @override
  Widget build(BuildContext context) {


    return new AlertDialog(
      title: const Text('Change Password'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              children: [

                // old phone number  text form field
                TextFormField(
                  controller: _emailcontrol,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Enter your email address ",
                    contentPadding: EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),

                  ),
                ),

                SizedBox(height: 7,),

                // new phone number   text form field
                TextFormField(
                  controller: _newPasswordcontrol,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Enter your new Password",
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

    Future change_password() async {
      dynamic token = await FlutterSession().get("data");
      var url = "http://192.168.64.2/Mobile/change_password.php";
      var response = await http.post(Uri.parse(url), body: {
        "email": _emailcontrol.text,
        "newPassword": _newPasswordcontrol.text,

      });

      data = json.decode(response.body);
      if( data=="Error"){

        showDialog(
          context: context,
          builder: (BuildContext context) => _builDialog(context),
        );
        Navigator.of(context).pop();

      }

      else{

        showDialog(
          context: context,
          builder: (BuildContext context) => _builDialog(context),
        );

        Navigator.of(context).pop();


      }

    }


    return new AlertDialog(
      title: const Text('Confirmation'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Are you sure you want to change the password? "),
        ],
      ),
      actions: <Widget>[
        new RaisedButton(
          onPressed: () {

            change_password();
            Navigator.of(context).pop();


          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('Yes'),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
            change_password();
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('No'),
        ),

      ],
    );
  }
}



Widget _builDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Change Password  status'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[


        // TO DO add response from the data using dollar sign
        Text("Password changed  " + data),
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