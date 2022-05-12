import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/main.dart';
import 'dart:convert';
import 'map_data.dart';



Future<List<SensorData>> getSensorDetails() async {
  dynamic token = await FlutterSession().get("data");
  //send http post request
  final response = await http.post(
    Uri.parse("http://20.90.108.172/Mobile/getDetails.php"),
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
    print(data);
    //map the response to the MapData class
    var result = data.map((sensorData) => SensorData.fromJson(sensorData)).toList();
    //print(result[])
    return result;
  } else {
    throw Exception('Failed to create album.');
  }
}


class LogData extends StatefulWidget {
  const LogData({Key? key}) : super(key: key);

  @override
  _LogDataState createState() => _LogDataState();
}

class _LogDataState extends State<LogData> {
  //@override
  //Widget build(BuildContext context) {
  // return Container();

  //}
//}





//class ViewAllUsers extends StatelessWidget {
  String serials = "";
  String roomName ="";
  String floor = "";
  String time = "";




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
        backgroundColor: Colors.redAccent
      ),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: sensorDetails.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.list),
                  title:Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[Text("Device Serial : " +" " + sensorDetails[index].serials,style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                        Text("Room Name : " +" " +sensorDetails[index].roomName,style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),

                        Text("Floor : " +" " +sensorDetails[index].floor,style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ]),
                  subtitle: Text("Date and Time : " +" " +sensorDetails[index].time, style: TextStyle(
                      fontWeight: FontWeight.bold),),
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



  // onSearch( String search){
  //   print(search);
  // }


