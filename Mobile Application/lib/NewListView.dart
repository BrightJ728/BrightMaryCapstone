import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/main.dart';
import 'dart:convert';
import 'map_data.dart';


Future<List<MapData>> getUsers() async {
  dynamic token = await FlutterSession().get("data");
  //send http post request
  final response = await http.post(
    Uri.parse("http://20.90.108.172/Mobile/getUsers.php"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "Fs_email": token,
    }),
  );
  //check the status of http request
  if (response.statusCode == 200) {
    //decode the response
    List data = json.decode(response.body);
    //map the response to the MapData class
    var result = data.map((mapData) => MapData.fromJson(mapData)).toList();
    //print(result[])

    return result;
  } else {
    throw Exception('Failed to create album.');
  }
}

class NewListView extends StatefulWidget {
  const NewListView({Key? key}) : super(key: key);

  @override
  _NewListViewState createState() => _NewListViewState();
}

class _NewListViewState extends State<NewListView> {

  //class ViewAllUsers extends StatelessWidget {
  String name = "";
  String email ="";
  String PhoneNumber = "";


  //final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
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
    return Container();
  }
}
