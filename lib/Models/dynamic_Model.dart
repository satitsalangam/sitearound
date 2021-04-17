// To parse this JSON data, do
//
//     final dynamicModel = dynamicModelFromJson(jsonString);

import 'dart:convert';

DynamicModel dynamicModelFromJson(String str) =>
    DynamicModel.fromJson(json.decode(str));

String dynamicModelToJson(DynamicModel data) => json.encode(data.toJson());

class DynamicModel {
  DynamicModel({
    this.count,
    this.page,
    this.result,
  });

  int count;
  int page;
  List<Result> result;

  factory DynamicModel.fromJson(Map<String, dynamic> json) => DynamicModel(
        count: json["count"] == null ? null : json["count"],
        page: json["page"] == null ? null : json["page"],
        result: json["result"] == null
            ? null
            : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "page": page == null ? null : page,
        "result": result == null
            ? null
            : List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.process,
    this.documentCode,
    this.title,
    this.dueDate,
    this.status,
    this.completionDate,
    this.startDate,
    this.order,
    this.ballInCourt,
  });

  int id;
  int process;
  String documentCode;
  String title;
  dynamic dueDate;
  int status;
  DateTime completionDate;
  DateTime startDate;
  int order;
  List<dynamic> ballInCourt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        process: json["process"] == null ? null : json["process"],
        documentCode:
            json["document_code"] == null ? null : json["document_code"],
        title: json["title"] == null ? null : json["title"],
        dueDate: json["due_date"],
        status: json["status"] == null ? null : json["status"],
        completionDate: json["completion_date"] == null
            ? null
            : DateTime.parse(json["completion_date"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        order: json["order"] == null ? null : json["order"],
        ballInCourt: json["ball_in_court"] == null
            ? null
            : List<dynamic>.from(json["ball_in_court"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "process": process == null ? null : process,
        "document_code": documentCode == null ? null : documentCode,
        "title": title == null ? null : title,
        "due_date": dueDate,
        "status": status == null ? null : status,
        "completion_date":
            completionDate == null ? null : completionDate.toIso8601String(),
        "start_date": startDate == null ? null : startDate.toIso8601String(),
        "order": order == null ? null : order,
        "ball_in_court": ballInCourt == null
            ? null
            : List<dynamic>.from(ballInCourt.map((x) => x)),
      };
}
