import 'package:flutter/material.dart';
import 'package:mobile_app/signup.dart';
import 'package:mobile_app/login.dart';
import 'package:mobile_app/addUser.dart';
import 'package:mobile_app/changePassword.dart';
import 'package:mobile_app/logOut.dart';
import 'package:mobile_app/notificationPreferences.dart';
import 'package:mobile_app/side_left_drawer.dart';
import 'package:mobile_app/help.dart';
import 'package:mobile_app/logData.dart';
import 'package:mobile_app/GridView.dart';
import 'package:mobile_app/notifications_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/main.dart';
import 'dart:convert';

import 'map_data.dart';

var data;
final _globalkey = GlobalKey<FormState>();
final TextEditingController _serialnumbercontrol = new TextEditingController();
final TextEditingController _roomcontrol = new TextEditingController();
final TextEditingController _floorcontrol = new TextEditingController();

Future<List<SensorData>> getSensorDetails() async {
  dynamic token = await FlutterSession().get("data");
  //send http post request

   final response = await http.post(
    Uri.parse("http://20.90.108.172/Mobile/getDetails.php"), body: {
    "Fs_email": token,
   });

  //check the status of http request
  if (response.statusCode == 200) {
    //decode the response
    List data = json.decode(response.body);

    //map the response to the MapData class
    var result = data.map((sensorData) => SensorData.fromJson(sensorData)).toList();

    return result;
  } else {
    throw Exception('Failed to create album.');
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String serials = "";
  String roomName ="";
  String floor = "";



  //final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  void initializeList()async{
    sensorDetails = await getSensorDetails();
  }


  @override
  void initState()
  {
    super.initState();
    initializeList();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
          backgroundColor: Colors.redAccent
      ),
      backgroundColor: Colors.red[300],

      drawer: const leftDrawerMenu(),
      // body: SafeArea(
      //   child: Container(),
      // ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        shape: CircularNotchedRectangle(),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,

              onPressed: () {
              },
            ),

            IconButton(
              icon: Icon(Icons.assessment_outlined), // change to a nice icon for logss
              color: Colors.white,
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  LogData()));
              },
            ),

            IconButton(
              icon: Icon(Icons.call), // help
              color: Colors.white,
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpPage()));

              },
            ),

            IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsLogs()));

              },
            ),


            Divider(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
        },
        child: Icon(Icons.add),
      ),



      /**
       * returns the list  view of device details
       */

      body: ListView.builder(
        padding: EdgeInsets.all(10),
          itemCount: sensorDetails.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.redAccent[300],
                child: ListTile(
                  leading: Icon(Icons.local_fire_department_sharp),
                  title:Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[Text( "Device Serial : " +" " +sensorDetails[index].serials,style: TextStyle(
                      fontWeight: FontWeight.bold),),
                        Text("Room Name : " +" " +sensorDetails[index].roomName,style: TextStyle(
                            fontWeight: FontWeight.bold),),
                      ]),
                  subtitle: Text("Floor: " +" " +sensorDetails[index].floor,style: TextStyle(
            fontWeight: FontWeight.bold),),
                  //subtitle: data,

                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _Dialog(context),
                    );
                  },
                ));

            // return Card(
            //     color: Colors.white,
            //     child: Padding(
            //         padding: const EdgeInsets.all(5.0),
            //         child: ListTile(
            //           title:Column(mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children:[Text(sensorDetails[index].serials),
            //                 Text(sensorDetails[index].roomName),
            //               ]),
            //           subtitle: Text(sensorDetails[index].floor),
            //           //subtitle: data,
            //
            //           onTap: () {
            //              showDialog(
            //                context: context,
            //                builder: (BuildContext context) => _builDialog(context),
            //             );
            //           },
            //         )));
          }),



      // body: GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,crossAxisSpacing: 8, mainAxisSpacing: 4
      //
      //     ),
      //
      //     padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
      //     itemCount: sensorDetails.length <= 4 ? sensorDetails.length:4,
      //     itemBuilder: (context, index) {
      //       return Card(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           color: Colors.white,
      //           child: ListTile(
      //             title:Column(mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children:[
      //                   //SizedBox(height: 20,),
      //                   Text(sensorDetails[index].serials),
      //                   //SizedBox(height: 30,),
      //                   Text(sensorDetails[index].roomName),
      //                   //SizedBox(height: 30,),
      //                   Text(sensorDetails[index].floor),
      //                 ]),
      //             //subtitle: Text(sensorDetails[index].floor),
      //
      //             onTap: () {
      //               showDialog(
      //                 context: context,
      //                 builder: (BuildContext context) => _Dialog(context),
      //               );
      //             },
      //           ));
      //     }),

    );
  }
}

// popup menu to enter device details

Widget _buildPopupDialog(BuildContext context) {
  Future add_devices() async {
    dynamic token = await FlutterSession().get("data");
    var url = "http://20.90.108.172/Mobile/add_devices.php";
    var response = await http.post(Uri.parse(url), body: {
      "serial": _serialnumbercontrol.text,
      "room": _roomcontrol.text,
      "floor": _floorcontrol.text,
     "email": token,


    });

     data = json.decode(response.body);
    if( data=="Error"){
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) => _dialog(context),
      );

    }

    else{
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) => _dialog(context),
      );

      _serialnumbercontrol.clear();
     _roomcontrol.clear();
     _floorcontrol.clear();


    }


  }


  return new AlertDialog(
    title: const Text('Enter Device details'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
    Container(
    child:Column(
        children:[

        // device serial number   text form field
        TextFormField(
          controller: _serialnumbercontrol,
          textInputAction: TextInputAction.next,
          decoration:InputDecoration(
            hintText: "Device serial number",
            contentPadding: EdgeInsets.all(12.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
            ),

          ) ,
        ),

          SizedBox(height: 7,),

          // room where device is installed  text form field
          TextFormField(
            controller: _roomcontrol,
            textInputAction: TextInputAction.next,
            decoration:InputDecoration(
              hintText: "Room where device is installed",
              contentPadding: EdgeInsets.all(12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
              ),

            ) ,
          ),
          SizedBox(height: 7,),


// floor where device is installed  text form field
          TextFormField(
            controller: _floorcontrol,
            textInputAction: TextInputAction.done,
            decoration:InputDecoration(
              hintText: "Floor where device is installed",
              contentPadding: EdgeInsets.all(12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
              ),

            ) ,
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
            builder: (BuildContext context) => _dialog(context),
          );
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Install Device'),

      ),
    ],
  );
}


Widget _dialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Device installation status'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[


        // TO DO add response from the data using dollar sign
        Text("Device installed " + data),
      ],
    ),
    actions: <Widget>[
      new RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage()));

        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Close'),
      ),

    ],
  );
}





/**
 * Grid view display of the device details
 */

Widget _Dialog(BuildContext context) {
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
    var url = "http://20.90.108.172/Mobile/add_devices.php";
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

