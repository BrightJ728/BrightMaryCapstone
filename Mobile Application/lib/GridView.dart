import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/addUser.dart';
import 'dart:convert';

/**
 *
 * Display the data at the see all section
 */
var data;
final _globalkey = GlobalKey<FormState>();
final TextEditingController _serialnumbercontrol = new TextEditingController();
final TextEditingController _roomcontrol = new TextEditingController();
final TextEditingController _floorcontrol = new TextEditingController();

class HomePageData extends StatelessWidget {
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.redAccent,
      //   title: Container(
      //       height: 38,
      //       child: TextField(
      //           onChanged: (value) => onSearch(value),
      //           decoration: InputDecoration(
      //               filled: true ,
      //               fillColor: Colors.yellow,
      //               contentPadding: EdgeInsets.all(0),
      //               prefixIcon: Icon(Icons.search, color: Colors.red,),
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(50),
      //                 borderSide: BorderSide.none,
      //               ),
      //               hintStyle:
      //               TextStyle(
      //                 fontSize: 14,
      //                 color: Colors.black,
      //
      //               ),
      //               hintText: "installed devices"
      //
      //           )
      //       )
      //   ),
      // ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(titles[index]),
                  subtitle: Text(subtitles[index]),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _builDialog(context),
                    );
                  },
                ));
          }),
    );

  }

}

/**
 * Grid view display of the device details
 */

Widget _builDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Edit device details or Delete device '),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

    ),
    actions: <Widget>[
      new RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (BuildContext context) => _deviceDetailsDialog(context),
          );

        },
        textColor: Theme
            .of(context)
            .primaryColor,
        child: Text('Edit'),
      ),

      new RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (BuildContext context) => _FirstDialog(context),
          );

        },
        textColor: Theme
            .of(context)
            .primaryColor,
        child: Text('Delete'),
      ),

    ],
  );
}


/**
 * dialog box to edit device detials
 */

Widget _deviceDetailsDialog(BuildContext context) {
  Future add_devices() async {
    dynamic token = await FlutterSession().get("data");
    var url = "http://192.168.64.2/Mobile/add_devices.php";
    var response = await http.post(Uri.parse(url), body: {
      "serial": _serialnumbercontrol.text,
      "room": _roomcontrol.text,
      "floor": _floorcontrol.text,
      "email": token,

    });
  }

    return new AlertDialog(
      title: const Text('Edit Device details'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              children: [

// device serial number   text form field
                TextFormField(
                  controller: _serialnumbercontrol,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Device serial number",
                    contentPadding: EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),

                  ),
                ),

                SizedBox(height: 7,),

// room where device is installed  text form field
                TextFormField(
                  controller: _roomcontrol,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Room where device is installed",
                    contentPadding: EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),

                  ),
                ),
                SizedBox(height: 7,),


// floor where device is installed  text form field
                TextFormField(
                  controller: _floorcontrol,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Floor where device is installed",
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
            add_devices();
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) => _LastDialog(context),
            );
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: Text('Update Device details'),

        ),
      ],
    );

}

Widget _LastDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Update Device details status'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Device details updated  " ), // add the user response + data
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





/**
 * Deleting device pop up menu confirmation screen
 */

Widget _FirstDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Confirmation'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Are you sure you want to delete this device? "),
      ],
    ),
    actions: <Widget>[
      new RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (BuildContext context) => _FinalDialog(context),
          );



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
        child: Text('No'),
      ),

    ],
  );
}


Widget _FinalDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Delete Device status'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Device deleted " ), // add the user response + data
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


