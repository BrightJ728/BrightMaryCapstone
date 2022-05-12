import 'package:flutter/material.dart';
import 'package:mobile_app/viewAllUsers.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/login.dart';

final TextEditingController _emailcontrol = new TextEditingController();
var data;
class ViewUsers extends StatelessWidget {

  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _namecontrol = new TextEditingController();
  //final TextEditingController _emailcontrol = new TextEditingController();
  final TextEditingController _phonenumbercontrol = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    Future add_user() async {
      dynamic token = await FlutterSession().get("data");
      var url = "http://20.90.108.172/Mobile/new_user.php";
      var response = await http.post(Uri.parse(url), body: {
        "name": _namecontrol.text,
        "email": _emailcontrol.text,
        "phone": _phonenumbercontrol.text,
        "Fs_email": token,


      });

      data = json.decode(response.body);
      if( data=="Error"){
        showDialog(
          context: context,
          builder: (BuildContext context) => _builDialog(context),
        );

      }

      else{

        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ViewAllUsers()));
        _emailcontrol.clear();
        _phonenumbercontrol.clear();
        _namecontrol.clear();


      }


    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Add other users'),
          backgroundColor: Colors.redAccent
      ),
      body: Center(

          child: SingleChildScrollView(
            // center of content - whole body
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Container(
                  child: Form(
                      key: _globalkey,
                      child: Column(children: <Widget>[

                        // name  text form field
                        TextFormField(
                          controller: _namecontrol,
                          textInputAction: TextInputAction.next,
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Full Name",
                            contentPadding: EdgeInsets.all(12.0),

                          ) ,
                        ),
                        SizedBox(height: 30,),

                        // phone number   text form field
                        TextFormField(
                          controller: _phonenumbercontrol,
                          textInputAction: TextInputAction.next,
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: "Phone Number",
                            contentPadding: EdgeInsets.all(12.0),

                          ) ,
                        ),

                        SizedBox(height: 30,),

                        // email  text form field
                        TextFormField(
                          controller: _emailcontrol,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Email",
                            contentPadding: EdgeInsets.all(12.0),


                          ) ,
                        ),

                        SizedBox(height: 50,),
                        // signup button
                        MaterialButton(
                          minWidth: double.infinity,

                          //minWidth: MediaQuery.of(context).size.width/2,
                          height: 60,
                          color: Colors.red[400],
                          padding: EdgeInsets.all(12.0),
                          onPressed: () {

                            add_user();

                          },
                          // defining the shape
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white


                            ),
                          ),
                        ),

                      ]
                      )
                  )
              )
          )


      ),
    ); }
}




// Widget _ialog(BuildContext context) {
//
//   final titles = ["List ", "List 2", "List 3"];
//   TextFormField(
//     controller: _emailcontrol,
//     textInputAction: TextInputAction.next,
//     decoration:InputDecoration(
//       prefixIcon: Icon(Icons.mail),
//       contentPadding: EdgeInsets.all(12.0),
//       onSaved: (value) {
//         titles[0] = value;
//       },
//
//
//     ) ,
//   );
//
//
// }


/**
 * Dialog box to display adding user  status
 */
Widget _builDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('User added status'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text("User Added " + data),
      ],
    ),
    actions: <Widget>[
      new RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Close'),
      ),

    ],
  );
}
