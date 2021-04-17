// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
    Location({
        @required this.id,
        @required this.phone,
        @required this.name,
        @required this.estimatedValue,
        @required this.image,
        @required this.code,
        @required this.finishVariance,
        @required this.avtualComplete,
        @required this.planComplete,
        @required this.squareFeet,
        @required this.completionDate,
        @required this.completionPlanDate,
        @required this.startPlanDate,
        @required this.startDate,
        @required this.description,
        @required this.organization,
        @required this.process,
        @required this.projectType,
        @required this.personList,
        @required this.country,
        @required this.timeZone,
        @required this.address,
        @required this.state,
        @required this.city,
        @required this.postcode,
        @required this.latitude,
        @required this.longitude,
        @required this.zone,
    });

    int id;
    String phone;
    String name;
    String estimatedValue;
    String image;
    String code;
    dynamic finishVariance;
    dynamic avtualComplete;
    dynamic planComplete;
    int squareFeet;
    DateTime completionDate;
    dynamic completionPlanDate;
    dynamic startPlanDate;
    DateTime startDate;
    String description;
    int organization;
    int process;
    int projectType;
    List<dynamic> personList;
    String country;
    String timeZone;
    String address;
    String state;
    String city;
    String postcode;
    String latitude;
    String longitude;
    String zone;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] == null ? null : json["id"],
        phone: json["phone"] == null ? null : json["phone"],
        name: json["name"] == null ? null : json["name"],
        estimatedValue: json["estimated_value"] == null ? null : json["estimated_value"],
        image: json["image"] == null ? null : json["image"],
        code: json["code"] == null ? null : json["code"],
        finishVariance: json["finish_variance"],
        avtualComplete: json["avtual_complete"],
        planComplete: json["plan_complete"],
        squareFeet: json["square_feet"] == null ? null : json["square_feet"],
        completionDate: json["completion_date"] == null ? null : DateTime.parse(json["completion_date"]),
        completionPlanDate: json["completion_plan_date"],
        startPlanDate: json["start_plan_date"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        description: json["description"] == null ? null : json["description"],
        organization: json["organization"] == null ? null : json["organization"],
        process: json["process"] == null ? null : json["process"],
        projectType: json["project_type"] == null ? null : json["project_type"],
        personList: json["person_list"] == null ? null : List<dynamic>.from(json["person_list"].map((x) => x)),
        country: json["country"] == null ? null : json["country"],
        timeZone: json["time_zone"] == null ? null : json["time_zone"],
        address: json["address"] == null ? null : json["address"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        zone: json["zone"] == null ? null : json["zone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "phone": phone == null ? null : phone,
        "name": name == null ? null : name,
        "estimated_value": estimatedValue == null ? null : estimatedValue,
        "image": image == null ? null : image,
        "code": code == null ? null : code,
        "finish_variance": finishVariance,
        "avtual_complete": avtualComplete,
        "plan_complete": planComplete,
        "square_feet": squareFeet == null ? null : squareFeet,
        "completion_date": completionDate == null ? null : completionDate.toIso8601String(),
        "completion_plan_date": completionPlanDate,
        "start_plan_date": startPlanDate,
        "start_date": startDate == null ? null : startDate.toIso8601String(),
        "description": description == null ? null : description,
        "organization": organization == null ? null : organization,
        "process": process == null ? null : process,
        "project_type": projectType == null ? null : projectType,
        "person_list": personList == null ? null : List<dynamic>.from(personList.map((x) => x)),
        "country": country == null ? null : country,
        "time_zone": timeZone == null ? null : timeZone,
        "address": address == null ? null : address,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "postcode": postcode == null ? null : postcode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "zone": zone == null ? null : zone,
    };
}
