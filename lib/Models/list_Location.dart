// To parse this JSON data, do
//
//     final listLocation = listLocationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListLocation listLocationFromJson(String str) => ListLocation.fromJson(json.decode(str));

String listLocationToJson(ListLocation data) => json.encode(data.toJson());

class ListLocation {
    ListLocation({
        @required this.result,
        @required this.count,
        @required this.page,
    });

    List<Result> result;
    int count;
    int page;

    factory ListLocation.fromJson(Map<String, dynamic> json) => ListLocation(
        result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        count: json["count"] == null ? null : json["count"],
        page: json["page"] == null ? null : json["page"],
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? null : List<dynamic>.from(result.map((x) => x.toJson())),
        "count": count == null ? null : count,
        "page": page == null ? null : page,
    };
}

class Result {
    Result({
        @required this.id,
        @required this.name,
        @required this.value,
        @required this.title,
        @required this.parentContextData,
        @required this.parent,
        @required this.displayName,
        @required this.createdAt,
        @required this.updatedAt,
    });

    int id;
    String name;
    int value;
    String title;
    Result parentContextData;
    int parent;
    String displayName;
    DateTime createdAt;
    DateTime updatedAt;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
        title: json["title"] == null ? null : json["title"],
        parentContextData: json["parent_context_data"] == null ? null : Result.fromJson(json["parent_context_data"]),
        parent: json["parent"] == null ? null : json["parent"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "value": value == null ? null : value,
        "title": title == null ? null : title,
        "parent_context_data": parentContextData == null ? null : parentContextData.toJson(),
        "parent": parent == null ? null : parent,
        "display_name": displayName == null ? null : displayName,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
