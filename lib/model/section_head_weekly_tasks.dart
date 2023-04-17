
import 'package:meta/meta.dart';
import 'dart:convert';

List<HeadTasks> headTasksFromJson(String str) => List<HeadTasks>.from(json.decode(str).map((x) => HeadTasks.fromJson(x)));

String headTasksToJson(List<HeadTasks> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HeadTasks {
  HeadTasks({
    required this.timestamp,
    required this.section,
    required this.day,
    required this.workDetails,
    required this.status,
  });

  String timestamp;
  String section;
  String day;
  String workDetails;
  String status;


  factory HeadTasks.fromJson(Map<String, dynamic> json) => HeadTasks(
    timestamp: json["Timestamp"]?? '',
    section: json["महाशाखा/ शाखा"]?? '',
    day: json["मिति"]?? '',
    workDetails: json["कार्य विवरण"]?? '',
    status: json["कार्य सम्पन्न भए/नभएको"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "Timestamp": timestamp,
    "महाशाखा/ शाखा": section,
    "मिति": day,
    "कार्य विवरण": workDetails,
    "कार्य सम्पन्न भए/नभएको": status,

  };
}

