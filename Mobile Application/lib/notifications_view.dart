import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/main.dart';
import 'dart:convert';
import 'map_data.dart';

Future<List<NotifyData>> getNotifyDetails() async {
  dynamic token = await FlutterSession().get("data");
  //send http post request

  final response = await http.post(
      Uri.parse("http://20.90.108.172/Mobile/getNotify.php"), body: {
    "Fs_email": token,
  });

  //check the status of http request
  if (response.statusCode == 200) {
    //decode the response
    List data = json.decode(response.body);

    //map the response to the MapData class
    var result = data.map((notifyData) => NotifyData.fromJson(notifyData)).toList();

    return result;
  } else {
    throw Exception('Failed to create album.');
  }
}



// Future<List<NotifyData>> getNotifyDetails() async {
//   //dynamic token = await FlutterSession().get("data");
//   //send http post request
//   final response = await http.post(
//     Uri.parse("http://20.90.108.172/Mobile/getNotify.php"),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     // body: jsonEncode(<String, String>{
//     //   "Fs_email": token,
//     // }),
//   );
//   //check the status of http request
//   if (response.statusCode == 200) {
//     //decode the response
//     List data = json.decode(response.body);
//     print(data);
//     //map the response to the MapData class
//     var result = data.map((notifyData) => NotifyData.fromJson(notifyData)).toList();
//     //print(result[])
//
//     return result;
//   } else {
//     throw Exception('Failed to create album.');
//   }
// }


class NotificationsLogs extends StatefulWidget {
  const  NotificationsLogs({Key? key}) : super(key: key);

  @override
  _NotificationsLogsState createState() => _NotificationsLogsState();
}

class _NotificationsLogsState extends State<NotificationsLogs> {

  String serials = "";
  String status = "";
  String Datetime ="";



  void initializeList()async{
    NotifyDetails = await getNotifyDetails();

  }


  @override
  void initState()
  {
    super.initState();
    initializeList();
  }


  /**
   *  Search bar code
   */


//   _searchTap(){
//
//     setState(() {
//       if(_searchInput.text==null){
// // Do nothing
//       }
//       else {
//         filteredNotifications = AllNotifications;
//         _searchInput.clear();
//
//       }
//     });
//
//   }


  // _NotificationsLogsState(){
  //   _searchInput.addListener(() {
  //
  //     if(_searchInput.text==null){
  //       setState(() {
  //         _searchItem= "";
  //         filteredNotifications=userData;
  //
  //       });
  //     }
  //     else{
  //       setState(() {
  //         _searchItem=_searchInput.text;
  //       });
  //
  //     }
  //   });
  // }














  Widget _buidDeviceList() {
    // _searchItem = _searchInput.text;
    // print(_searchInput.text);
// // Do nothing
    return ListView.builder(
      //padding: EdgeInsets.all(20),
        itemCount: NotifyDetails.length,
        itemBuilder: (context, index) {
          return Card(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    leading: Icon(Icons.notifications),
                    title:Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[Text("Status : " +" " +NotifyDetails[index].status),
                          Text("Date&Time : " +" " +NotifyDetails[index].Datetime,style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          Text("Device Serial : " +" " +NotifyDetails[index].serials,style: TextStyle(
                              fontWeight: FontWeight.bold
                           ),),

                        ]),
                    // subtitle: Text(userData[index].email,style: TextStyle(
                    //     fontWeight: FontWeight.bold
                    // ),),
                    //subtitle: data,

                  )));
        });
    // }


    //filteredNotifications = AllNotifications;
    // _searchInput.clear();


    // List NewList = [];
    // for (int i = 0; i < userData.length; i++) {
    //   if (userData[i].Name == (_searchItem)) {
    //     print("trye");
    //     print(userData[i].Name);
    //     NewList.add(_searchItem);
    //   }
    // }
    // filteredNotifications = NewList;
    //
    // return ListView.builder(
    //   itemCount: filteredNotifications.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return new ListTile(
    //       title: Text(filteredNotifications[index]),
    //       //onTap: () => print(filteredNotifications[index]['name']),
    //     );
    //   },
    // );
    //
    //
    // print(NewList);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent

        // title: Container(
        //     height: 38,
        //     child: TextField(
        //       //onChanged: (value) => onSearch(),
        //         controller: _searchInput,
        //         decoration: InputDecoration(
        //             filled: true,
        //             fillColor: Colors.yellow[50],
        //
        //             contentPadding: EdgeInsets.all(0),
        //             prefixIcon: Icon(Icons.search, color: Colors.red,),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(50),
        //               borderSide: BorderSide.none,
        //             ),
        //             hintStyle:
        //             TextStyle(
        //               fontSize: 14,
        //               color: Colors.black,
        //
        //             ),
        //             hintText: "search other notified users"
        //
        //
        //         )
        //     )
        // ),
      ),

      backgroundColor: Colors.white,

      body: Container(
        child: _buidDeviceList(),

      ),
    );

  }


}
