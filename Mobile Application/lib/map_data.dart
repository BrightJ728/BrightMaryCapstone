//import 'package:intl/intl.dart';

/**
    Map class For Sensor device details
 */
class SensorData {
  final String? serials;
  final String? roomName;
  final String? floor;
  final String? time;

  SensorData({this.serials, this.roomName, this.floor,this.time});


  factory SensorData.fromJson(Map<String, dynamic> json){
    //DateFormat('yyyy-MM-dd - kk:mm').format(['time'])
    return SensorData(
      serials: json['serials'],
      roomName: json['roomName'],
      floor: json['floor'],
     time: json['time'],
    );
  }
}


class NotifyData {
  final String? serials;
  final String? status;
  final String? Datetime;

  NotifyData({this.serials,this.status, this.Datetime});

  factory NotifyData.fromJson(Map<String, dynamic> json){
    return NotifyData(
      status: json['status'],
      Datetime: json['Datetime'],
      serials: json['serials'],
    );
  }
}







class MapData {
final String? Name;
final String? phoneNumber;
final String? email;

MapData({this.Name, this.phoneNumber, this.email});

factory MapData.fromJson(Map<String, dynamic> json){
  return MapData(
  Name: json['Name'],
  phoneNumber: json['phoneNumber'],
  email: json['email'],
  );
}
}

