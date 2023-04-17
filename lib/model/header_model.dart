
import 'package:meta/meta.dart';
import 'dart:convert';

List<Headers> headersFromJson(String str) => List<Headers>.from(json.decode(str).map((x) => Headers.fromJson(x)));

String headersToJson(List<Headers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Headers {
  Headers({
    required this.sn,
    required this.name,
    required this.ward,
    required this.planned_budget,
    required this.contract_date,
    required this.completion_date,
    required this.contract_amount,
    required this.progress_physical,
    required this.progress_intangible,
    required this.plan_status,
    required this.vendor,
    required this.responsible_person,
    required this.images,
  });

  String sn;
  String name;
  String ward;
  String planned_budget;
  String contract_date;
  String completion_date;
  String contract_amount;
  String progress_physical;
  String progress_intangible;
  String plan_status;
  String responsible_person;
  String vendor;
  String images;

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
    sn: json["सि.नं"]?? '',
    name: json["योजनाको नाम"]?? '',
    ward: json["वडा नं"]?? '',
    planned_budget: json["बिनियोजित बजेट"]?? '',
    contract_date: json["सम्झौता मिति"]?? '',
    completion_date: json["सम्पन्न हुने मिति"]?? '',
    contract_amount: json["सम्झौता रकम"]?? '',
    progress_physical: json["कार्य प्रगती भौतिक"]?? '',
    progress_intangible: json["कार्य प्रगती वित्तीय"]?? '',
    plan_status: json["योजनाको हालको स्थिति"]?? '',
    vendor: json["निर्माण ब्यवसायी"]?? '',
    responsible_person: json["सम्वनधित व्यक्ति"]?? '',
    images: json["images_url"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "सि.नं": sn,
    "योजनाको नाम": name,
    "वडा नं": ward,
    "बिनियोजित बजेट": planned_budget,
    "सम्झौता मिति": contract_date,
    "सम्पन्न हुने मिति": completion_date,
    "सम्झौता रकम": contract_amount,
    "कार्य प्रगती भौतिक": progress_physical,
    "कार्य प्रगती वित्तीय": progress_intangible,
    "योजनाको हालको स्थिति": plan_status,
    "निर्माण ब्यवसायी": vendor,
    "सम्वनधित व्यक्ति": responsible_person,
    "images_url": images,
  };
}

