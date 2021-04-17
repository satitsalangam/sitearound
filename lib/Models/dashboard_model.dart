// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
    DashboardModel({
        this.rfi,
        this.submittal,
        this.inspection,
    });

    Inspection rfi;
    Inspection submittal;
    Inspection inspection;

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        rfi: json["rfi"] == null ? null : Inspection.fromJson(json["rfi"]),
        submittal: json["submittal"] == null ? null : Inspection.fromJson(json["submittal"]),
        inspection: json["inspection"] == null ? null : Inspection.fromJson(json["inspection"]),
    );

    Map<String, dynamic> toJson() => {
        "rfi": rfi == null ? null : rfi.toJson(),
        "submittal": submittal == null ? null : submittal.toJson(),
        "inspection": inspection == null ? null : inspection.toJson(),
    };
}

class Inspection {
    Inspection({
        this.closed,
        this.overdue,
        this.open,
    });

    int closed;
    int overdue;
    int open;

    factory Inspection.fromJson(Map<String, dynamic> json) => Inspection(
        closed: json["closed"] == null ? null : json["closed"],
        overdue: json["overdue"] == null ? null : json["overdue"],
        open: json["open"] == null ? null : json["open"],
    );

    Map<String, dynamic> toJson() => {
        "closed": closed == null ? null : closed,
        "overdue": overdue == null ? null : overdue,
        "open": open == null ? null : open,
    };
}
