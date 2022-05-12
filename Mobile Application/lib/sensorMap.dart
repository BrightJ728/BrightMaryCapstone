/**
    Map class For Sensor device details
 */
class SensorData {
  final String? serials;
  final String? roomName;
  final String? floor;

  SensorData({this.serials, this.roomName, this.floor});

  factory SensorData.fromJson(Map<String, dynamic> json){
    return SensorData(
      serials: json['serials'],
      roomName: json['roomName'],
      floor: json['floor'],
    );
  }
}