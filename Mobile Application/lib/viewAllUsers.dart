import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/addUser.dart';
import 'dart:convert';
import 'map_data.dart';


Future<List<MapData>> getUsers() async {
  dynamic token = await FlutterSession().get("data");
  print(token);
  //send http post request
  final response = await http.post(
      Uri.parse("http://20.90.108.172/Mobile/getUsers.php") , body: {
    "Fs_email": token,
  });


  //check the status of http request
  if (response.statusCode == 200) {
    //decode the response
    List data = json.decode(response.body);
    //map the response to the MapData class
    var result = data.map((mapData) => MapData.fromJson(mapData)).toList();
    //print(result);
    return result;
  } else {
    throw Exception('Failed to create album.');
  }
}


class ViewAllUsers extends StatefulWidget {
  const ViewAllUsers({Key? key}) : super(key: key);

  @override
  _ViewAllUsersState createState() => _ViewAllUsersState();
}

class _ViewAllUsersState extends State<ViewAllUsers> {


//class ViewAllUsers extends StatelessWidget {
  String name = "";
  String email ="";
  String PhoneNumber = "";


  void initializeList()async{
    userData = await getUsers();
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
        backgroundColor: Colors.redAccent
      ),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
          padding: EdgeInsets.all(1),
          itemCount: userData.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.white,

                child: ListTile(
                  leading: Icon(Icons.account_circle),

                  trailing: RaisedButton(
                    child: Text(
                      'Edit / Delete',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    color: Colors.redAccent,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _builDialog(context),
                      );
                    },
                  ),

                  title:Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[Text( "Name : " +" " +userData[index].Name),
                        Text( "Number : " +" " +userData[index].phoneNumber,style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ]),
                  subtitle: Text( "Email: " +" " +userData[index].email,style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  //subtitle: data,

                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) =>
                    //       _builDialog(context),
                    // );
                  },
                ));
          }),
    );
  }


}


Widget _builDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Edit user details or Delete User '),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

    ),
    actions: <Widget>[
      new RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewUsers(),
            ),
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
 * Deleting user pop up menu confirmation screen
 */

Widget _FirstDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Confirmation'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Are you sure you want to delete this user? "),
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

          // TO-DO add the delete action from the database

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
    title: const Text('Delete user status'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("User deleted " ), // add the user response + data
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
 * View user details dialog box
 */
Widget _Dialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('view added  users  status'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text("User info retrieval  "),
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