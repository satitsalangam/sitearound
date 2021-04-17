// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'dart:convert';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    this.results,
    this.count,
    this.page,
  });

  List<Result> results;
  dynamic count;
  dynamic page;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        count: json["count"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
        "count": count,
        "page": page,
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.phone,
    this.estimatedValue,
    this.image,
    this.code,
    this.finishVariance,
    this.avtualComplete,
    this.planComplete,
    this.squareFeet,
    this.completionDate,
    this.completionPlanDate,
    this.startPlanDate,
    this.startDate,
    this.description,
    this.organization,
    this.process,
    this.projectType,
    this.createdAt,
    this.sumRfiOd,
    this.sumRfiInWeek,
    this.sumRfiNextWeek,
    this.sumRfiTotal,
    this.sumTaskOd,
    this.sumTaskInWeek,
    this.sumTaskNextWeek,
    this.sumTaskTotal,
    this.sumInspectionOd,
    this.sumInspectionInWeek,
    this.sumInspectionNextWeek,
    this.sumInspectionTotal,
    this.sumSubmittalOd,
    this.sumSubmittalInWeek,
    this.sumSubmittalNextWeek,
    this.sumSubmittalTotal,
    this.sumFormOd,
    this.sumFormInWeek,
    this.sumFormNextWeek,
    this.sumFormTotal,
    this.sumDefectOd,
    this.sumDefectInWeek,
    this.sumDefectNextWeek,
    this.sumDefectTotal,
    this.actualComplete,
    this.duration,
    this.sumRfiOpen,
    this.sumRfiClose,
    this.sumInspectionOpen,
    this.sumInspectionClose,
    this.sumSubmittalOpen,
    this.sumSubmittalClose,
  });

  int id;
  String name;
  String phone;
  String estimatedValue;
  String image;
  String code;
  String finishVariance;
  dynamic avtualComplete;
  dynamic planComplete;
  int squareFeet;
  DateTime completionDate;
  dynamic completionPlanDate;
  dynamic startPlanDate;
  DateTime startDate;
  String description;
  Organization organization;
  Pro process;
  Pro projectType;
  DateTime createdAt;
  int sumRfiOd;
  int sumRfiInWeek;
  int sumRfiNextWeek;
  int sumRfiTotal;
  int sumTaskOd;
  int sumTaskInWeek;
  int sumTaskNextWeek;
  int sumTaskTotal;
  int sumInspectionOd;
  int sumInspectionInWeek;
  int sumInspectionNextWeek;
  int sumInspectionTotal;
  int sumSubmittalOd;
  int sumSubmittalInWeek;
  int sumSubmittalNextWeek;
  int sumSubmittalTotal;
  int sumFormOd;
  int sumFormInWeek;
  int sumFormNextWeek;
  int sumFormTotal;
  int sumDefectOd;
  int sumDefectInWeek;
  int sumDefectNextWeek;
  int sumDefectTotal;
  String actualComplete;
  int duration;
  int sumRfiOpen;
  int sumRfiClose;
  int sumInspectionOpen;
  int sumInspectionClose;
  int sumSubmittalOpen;
  int sumSubmittalClose;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        estimatedValue:
            json["estimated_value"] == null ? null : json["estimated_value"],
        image: json["image"] == null ? null : json["image"],
        code: json["code"] == null ? null : json["code"],
        finishVariance:
            json["finish_variance"] == null ? null : json["finish_variance"],
        avtualComplete: json["avtual_complete"],
        planComplete: json["plan_complete"],
        squareFeet: json["square_feet"] == null ? null : json["square_feet"],
        completionDate: json["completion_date"] == null
            ? null
            : DateTime.parse(json["completion_date"]),
        completionPlanDate: json["completion_plan_date"],
        startPlanDate: json["start_plan_date"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        description: json["description"] == null ? null : json["description"],
        organization: json["organization"] == null
            ? null
            : Organization.fromJson(json["organization"]),
        process: json["process"] == null ? null : Pro.fromJson(json["process"]),
        projectType: json["project_type"] == null
            ? null
            : Pro.fromJson(json["project_type"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        sumRfiOd: json["sum_rfi_od"] == null ? null : json["sum_rfi_od"],
        sumRfiInWeek:
            json["sum_rfi_in_week"] == null ? null : json["sum_rfi_in_week"],
        sumRfiNextWeek: json["sum_rfi_next_week"] == null
            ? null
            : json["sum_rfi_next_week"],
        sumRfiTotal:
            json["sum_rfi_total"] == null ? null : json["sum_rfi_total"],
        sumTaskOd: json["sum_task_od"] == null ? null : json["sum_task_od"],
        sumTaskInWeek:
            json["sum_task_in_week"] == null ? null : json["sum_task_in_week"],
        sumTaskNextWeek: json["sum_task_next_week"] == null
            ? null
            : json["sum_task_next_week"],
        sumTaskTotal:
            json["sum_task_total"] == null ? null : json["sum_task_total"],
        sumInspectionOd: json["sum_inspection_od"] == null
            ? null
            : json["sum_inspection_od"],
        sumInspectionInWeek: json["sum_inspection_in_week"] == null
            ? null
            : json["sum_inspection_in_week"],
        sumInspectionNextWeek: json["sum_inspection_next_week"] == null
            ? null
            : json["sum_inspection_next_week"],
        sumInspectionTotal: json["sum_inspection_total"] == null
            ? null
            : json["sum_inspection_total"],
        sumSubmittalOd:
            json["sum_submittal_od"] == null ? null : json["sum_submittal_od"],
        sumSubmittalInWeek: json["sum_submittal_in_week"] == null
            ? null
            : json["sum_submittal_in_week"],
        sumSubmittalNextWeek: json["sum_submittal_next_week"] == null
            ? null
            : json["sum_submittal_next_week"],
        sumSubmittalTotal: json["sum_submittal_total"] == null
            ? null
            : json["sum_submittal_total"],
        sumFormOd: json["sum_form_od"] == null ? null : json["sum_form_od"],
        sumFormInWeek:
            json["sum_form_in_week"] == null ? null : json["sum_form_in_week"],
        sumFormNextWeek: json["sum_form_next_week"] == null
            ? null
            : json["sum_form_next_week"],
        sumFormTotal:
            json["sum_form_total"] == null ? null : json["sum_form_total"],
        sumDefectOd:
            json["sum_defect_od"] == null ? null : json["sum_defect_od"],
        sumDefectInWeek: json["sum_defect_in_week"] == null
            ? null
            : json["sum_defect_in_week"],
        sumDefectNextWeek: json["sum_defect_next_week"] == null
            ? null
            : json["sum_defect_next_week"],
        sumDefectTotal:
            json["sum_defect_total"] == null ? null : json["sum_defect_total"],
        actualComplete:
            json["actual_complete"] == null ? null : json["actual_complete"],
        duration: json["duration"] == null ? null : json["duration"],
        sumRfiOpen: json["sum_rfi_open"] == null ? null : json["sum_rfi_open"],
        sumRfiClose:
            json["sum_rfi_close"] == null ? null : json["sum_rfi_close"],
        sumInspectionOpen: json["sum_inspection_open"] == null
            ? null
            : json["sum_inspection_open"],
        sumInspectionClose: json["sum_inspection_close"] == null
            ? null
            : json["sum_inspection_close"],
        sumSubmittalOpen: json["sum_submittal_open"] == null
            ? null
            : json["sum_submittal_open"],
        sumSubmittalClose: json["sum_submittal_close"] == null
            ? null
            : json["sum_submittal_close"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "estimated_value": estimatedValue == null ? null : estimatedValue,
        "image": image == null ? null : image,
        "code": code == null ? null : code,
        "finish_variance": finishVariance == null ? null : finishVariance,
        "avtual_complete": avtualComplete,
        "plan_complete": planComplete,
        "square_feet": squareFeet == null ? null : squareFeet,
        "completion_date":
            completionDate == null ? null : completionDate.toIso8601String(),
        "completion_plan_date": completionPlanDate,
        "start_plan_date": startPlanDate,
        "start_date": startDate == null ? null : startDate.toIso8601String(),
        "description": description == null ? null : description,
        "organization": organization == null ? null : organization.toJson(),
        "process": process == null ? null : process.toJson(),
        "project_type": projectType == null ? null : projectType.toJson(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "sum_rfi_od": sumRfiOd == null ? null : sumRfiOd,
        "sum_rfi_in_week": sumRfiInWeek == null ? null : sumRfiInWeek,
        "sum_rfi_next_week": sumRfiNextWeek == null ? null : sumRfiNextWeek,
        "sum_rfi_total": sumRfiTotal == null ? null : sumRfiTotal,
        "sum_task_od": sumTaskOd == null ? null : sumTaskOd,
        "sum_task_in_week": sumTaskInWeek == null ? null : sumTaskInWeek,
        "sum_task_next_week": sumTaskNextWeek == null ? null : sumTaskNextWeek,
        "sum_task_total": sumTaskTotal == null ? null : sumTaskTotal,
        "sum_inspection_od": sumInspectionOd == null ? null : sumInspectionOd,
        "sum_inspection_in_week":
            sumInspectionInWeek == null ? null : sumInspectionInWeek,
        "sum_inspection_next_week":
            sumInspectionNextWeek == null ? null : sumInspectionNextWeek,
        "sum_inspection_total":
            sumInspectionTotal == null ? null : sumInspectionTotal,
        "sum_submittal_od": sumSubmittalOd == null ? null : sumSubmittalOd,
        "sum_submittal_in_week":
            sumSubmittalInWeek == null ? null : sumSubmittalInWeek,
        "sum_submittal_next_week":
            sumSubmittalNextWeek == null ? null : sumSubmittalNextWeek,
        "sum_submittal_total":
            sumSubmittalTotal == null ? null : sumSubmittalTotal,
        "sum_form_od": sumFormOd == null ? null : sumFormOd,
        "sum_form_in_week": sumFormInWeek == null ? null : sumFormInWeek,
        "sum_form_next_week": sumFormNextWeek == null ? null : sumFormNextWeek,
        "sum_form_total": sumFormTotal == null ? null : sumFormTotal,
        "sum_defect_od": sumDefectOd == null ? null : sumDefectOd,
        "sum_defect_in_week": sumDefectInWeek == null ? null : sumDefectInWeek,
        "sum_defect_next_week":
            sumDefectNextWeek == null ? null : sumDefectNextWeek,
        "sum_defect_total": sumDefectTotal == null ? null : sumDefectTotal,
        "actual_complete": actualComplete == null ? null : actualComplete,
        "duration": duration == null ? null : duration,
        "sum_rfi_open": sumRfiOpen == null ? null : sumRfiOpen,
        "sum_rfi_close": sumRfiClose == null ? null : sumRfiClose,
        "sum_inspection_open":
            sumInspectionOpen == null ? null : sumInspectionOpen,
        "sum_inspection_close":
            sumInspectionClose == null ? null : sumInspectionClose,
        "sum_submittal_open":
            sumSubmittalOpen == null ? null : sumSubmittalOpen,
        "sum_submittal_close":
            sumSubmittalClose == null ? null : sumSubmittalClose,
      };
}

class Organization {
  Organization({
    this.id,
    this.name,
    this.code,
  });

  int id;
  String name;
  String code;

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "code": code == null ? null : code,
      };
}

class Pro {
  Pro({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Pro.fromJson(Map<String, dynamic> json) => Pro(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
