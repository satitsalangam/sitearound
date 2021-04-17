// To parse this JSON data, do
//
//     final projectDetail = projectDetailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProjectDetail projectDetailFromJson(String str) => ProjectDetail.fromJson(json.decode(str));

String projectDetailToJson(ProjectDetail data) => json.encode(data.toJson());

class ProjectDetail {
    ProjectDetail({
        @required this.id,
        @required this.permission,
        @required this.phone,
        @required this.name,
        @required this.estimatedValue,
        @required this.image,
        @required this.code,
        @required this.avtualComplete,
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
        @required this.sumRfiOd,
        @required this.sumRfiInWeek,
        @required this.sumRfiNextWeek,
        @required this.sumRfiTotal,
        @required this.sumTaskOd,
        @required this.sumTaskInWeek,
        @required this.sumTaskNextWeek,
        @required this.sumTaskTotal,
        @required this.sumInspectionOd,
        @required this.sumInspectionInWeek,
        @required this.sumInspectionNextWeek,
        @required this.sumInspectionTotal,
        @required this.sumSubmittalOd,
        @required this.sumSubmittalInWeek,
        @required this.sumSubmittalNextWeek,
        @required this.sumSubmittalTotal,
        @required this.sumFormOd,
        @required this.sumFormInWeek,
        @required this.sumFormNextWeek,
        @required this.sumFormTotal,
        @required this.sumDefectOd,
        @required this.sumDefectInWeek,
        @required this.sumDefectNextWeek,
        @required this.sumDefectTotal,
        @required this.finishVariance,
        @required this.actualComplete,
        @required this.planComplete,
        @required this.duration,
        @required this.sumRfiOpen,
        @required this.sumRfiClose,
        @required this.sumInspectionOpen,
        @required this.sumInspectionClose,
        @required this.sumSubmittalOpen,
        @required this.sumSubmittalClose,
    });

    int id;
    Permission permission;
    String phone;
    String name;
    String estimatedValue;
    String image;
    String code;
    dynamic avtualComplete;
    int squareFeet;
    DateTime completionDate;
    dynamic completionPlanDate;
    dynamic startPlanDate;
    DateTime startDate;
    String description;
    Organization organization;
    Pro process;
    Pro projectType;
    List<dynamic> personList;
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
    String finishVariance;
    String actualComplete;
    dynamic planComplete;
    int duration;
    int sumRfiOpen;
    int sumRfiClose;
    int sumInspectionOpen;
    int sumInspectionClose;
    int sumSubmittalOpen;
    int sumSubmittalClose;

    factory ProjectDetail.fromJson(Map<String, dynamic> json) => ProjectDetail(
        id: json["id"] == null ? null : json["id"],
        permission: json["permission"] == null ? null : Permission.fromJson(json["permission"]),
        phone: json["phone"] == null ? null : json["phone"],
        name: json["name"] == null ? null : json["name"],
        estimatedValue: json["estimated_value"] == null ? null : json["estimated_value"],
        image: json["image"] == null ? null : json["image"],
        code: json["code"] == null ? null : json["code"],
        avtualComplete: json["avtual_complete"],
        squareFeet: json["square_feet"] == null ? null : json["square_feet"],
        completionDate: json["completion_date"] == null ? null : DateTime.parse(json["completion_date"]),
        completionPlanDate: json["completion_plan_date"],
        startPlanDate: json["start_plan_date"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        description: json["description"] == null ? null : json["description"],
        organization: json["organization"] == null ? null : Organization.fromJson(json["organization"]),
        process: json["process"] == null ? null : Pro.fromJson(json["process"]),
        projectType: json["project_type"] == null ? null : Pro.fromJson(json["project_type"]),
        personList: json["person_list"] == null ? null : List<dynamic>.from(json["person_list"].map((x) => x)),
        sumRfiOd: json["sum_rfi_od"] == null ? null : json["sum_rfi_od"],
        sumRfiInWeek: json["sum_rfi_in_week"] == null ? null : json["sum_rfi_in_week"],
        sumRfiNextWeek: json["sum_rfi_next_week"] == null ? null : json["sum_rfi_next_week"],
        sumRfiTotal: json["sum_rfi_total"] == null ? null : json["sum_rfi_total"],
        sumTaskOd: json["sum_task_od"] == null ? null : json["sum_task_od"],
        sumTaskInWeek: json["sum_task_in_week"] == null ? null : json["sum_task_in_week"],
        sumTaskNextWeek: json["sum_task_next_week"] == null ? null : json["sum_task_next_week"],
        sumTaskTotal: json["sum_task_total"] == null ? null : json["sum_task_total"],
        sumInspectionOd: json["sum_inspection_od"] == null ? null : json["sum_inspection_od"],
        sumInspectionInWeek: json["sum_inspection_in_week"] == null ? null : json["sum_inspection_in_week"],
        sumInspectionNextWeek: json["sum_inspection_next_week"] == null ? null : json["sum_inspection_next_week"],
        sumInspectionTotal: json["sum_inspection_total"] == null ? null : json["sum_inspection_total"],
        sumSubmittalOd: json["sum_submittal_od"] == null ? null : json["sum_submittal_od"],
        sumSubmittalInWeek: json["sum_submittal_in_week"] == null ? null : json["sum_submittal_in_week"],
        sumSubmittalNextWeek: json["sum_submittal_next_week"] == null ? null : json["sum_submittal_next_week"],
        sumSubmittalTotal: json["sum_submittal_total"] == null ? null : json["sum_submittal_total"],
        sumFormOd: json["sum_form_od"] == null ? null : json["sum_form_od"],
        sumFormInWeek: json["sum_form_in_week"] == null ? null : json["sum_form_in_week"],
        sumFormNextWeek: json["sum_form_next_week"] == null ? null : json["sum_form_next_week"],
        sumFormTotal: json["sum_form_total"] == null ? null : json["sum_form_total"],
        sumDefectOd: json["sum_defect_od"] == null ? null : json["sum_defect_od"],
        sumDefectInWeek: json["sum_defect_in_week"] == null ? null : json["sum_defect_in_week"],
        sumDefectNextWeek: json["sum_defect_next_week"] == null ? null : json["sum_defect_next_week"],
        sumDefectTotal: json["sum_defect_total"] == null ? null : json["sum_defect_total"],
        finishVariance: json["finish_variance"] == null ? null : json["finish_variance"],
        actualComplete: json["actual_complete"] == null ? null : json["actual_complete"],
        planComplete: json["plan_complete"],
        duration: json["duration"] == null ? null : json["duration"],
        sumRfiOpen: json["sum_rfi_open"] == null ? null : json["sum_rfi_open"],
        sumRfiClose: json["sum_rfi_close"] == null ? null : json["sum_rfi_close"],
        sumInspectionOpen: json["sum_inspection_open"] == null ? null : json["sum_inspection_open"],
        sumInspectionClose: json["sum_inspection_close"] == null ? null : json["sum_inspection_close"],
        sumSubmittalOpen: json["sum_submittal_open"] == null ? null : json["sum_submittal_open"],
        sumSubmittalClose: json["sum_submittal_close"] == null ? null : json["sum_submittal_close"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "permission": permission == null ? null : permission.toJson(),
        "phone": phone == null ? null : phone,
        "name": name == null ? null : name,
        "estimated_value": estimatedValue == null ? null : estimatedValue,
        "image": image == null ? null : image,
        "code": code == null ? null : code,
        "avtual_complete": avtualComplete,
        "square_feet": squareFeet == null ? null : squareFeet,
        "completion_date": completionDate == null ? null : completionDate.toIso8601String(),
        "completion_plan_date": completionPlanDate,
        "start_plan_date": startPlanDate,
        "start_date": startDate == null ? null : startDate.toIso8601String(),
        "description": description == null ? null : description,
        "organization": organization == null ? null : organization.toJson(),
        "process": process == null ? null : process.toJson(),
        "project_type": projectType == null ? null : projectType.toJson(),
        "person_list": personList == null ? null : List<dynamic>.from(personList.map((x) => x)),
        "sum_rfi_od": sumRfiOd == null ? null : sumRfiOd,
        "sum_rfi_in_week": sumRfiInWeek == null ? null : sumRfiInWeek,
        "sum_rfi_next_week": sumRfiNextWeek == null ? null : sumRfiNextWeek,
        "sum_rfi_total": sumRfiTotal == null ? null : sumRfiTotal,
        "sum_task_od": sumTaskOd == null ? null : sumTaskOd,
        "sum_task_in_week": sumTaskInWeek == null ? null : sumTaskInWeek,
        "sum_task_next_week": sumTaskNextWeek == null ? null : sumTaskNextWeek,
        "sum_task_total": sumTaskTotal == null ? null : sumTaskTotal,
        "sum_inspection_od": sumInspectionOd == null ? null : sumInspectionOd,
        "sum_inspection_in_week": sumInspectionInWeek == null ? null : sumInspectionInWeek,
        "sum_inspection_next_week": sumInspectionNextWeek == null ? null : sumInspectionNextWeek,
        "sum_inspection_total": sumInspectionTotal == null ? null : sumInspectionTotal,
        "sum_submittal_od": sumSubmittalOd == null ? null : sumSubmittalOd,
        "sum_submittal_in_week": sumSubmittalInWeek == null ? null : sumSubmittalInWeek,
        "sum_submittal_next_week": sumSubmittalNextWeek == null ? null : sumSubmittalNextWeek,
        "sum_submittal_total": sumSubmittalTotal == null ? null : sumSubmittalTotal,
        "sum_form_od": sumFormOd == null ? null : sumFormOd,
        "sum_form_in_week": sumFormInWeek == null ? null : sumFormInWeek,
        "sum_form_next_week": sumFormNextWeek == null ? null : sumFormNextWeek,
        "sum_form_total": sumFormTotal == null ? null : sumFormTotal,
        "sum_defect_od": sumDefectOd == null ? null : sumDefectOd,
        "sum_defect_in_week": sumDefectInWeek == null ? null : sumDefectInWeek,
        "sum_defect_next_week": sumDefectNextWeek == null ? null : sumDefectNextWeek,
        "sum_defect_total": sumDefectTotal == null ? null : sumDefectTotal,
        "finish_variance": finishVariance == null ? null : finishVariance,
        "actual_complete": actualComplete == null ? null : actualComplete,
        "plan_complete": planComplete,
        "duration": duration == null ? null : duration,
        "sum_rfi_open": sumRfiOpen == null ? null : sumRfiOpen,
        "sum_rfi_close": sumRfiClose == null ? null : sumRfiClose,
        "sum_inspection_open": sumInspectionOpen == null ? null : sumInspectionOpen,
        "sum_inspection_close": sumInspectionClose == null ? null : sumInspectionClose,
        "sum_submittal_open": sumSubmittalOpen == null ? null : sumSubmittalOpen,
        "sum_submittal_close": sumSubmittalClose == null ? null : sumSubmittalClose,
    };
}

class Organization {
    Organization({
        @required this.id,
        @required this.name,
        @required this.code,
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

class Permission {
    Permission({
        @required this.corporate,
        @required this.directory,
        @required this.document,
        @required this.documentPlan,
        @required this.form,
        @required this.inspection,
        @required this.location,
        @required this.project,
        @required this.rfi,
        @required this.schedule,
        @required this.specification,
        @required this.submittal,
    });

    int corporate;
    int directory;
    int document;
    int documentPlan;
    int form;
    int inspection;
    int location;
    int project;
    int rfi;
    int schedule;
    int specification;
    int submittal;

    factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        corporate: json["Corporate"] == null ? null : json["Corporate"],
        directory: json["Directory"] == null ? null : json["Directory"],
        document: json["Document"] == null ? null : json["Document"],
        documentPlan: json["DocumentPlan"] == null ? null : json["DocumentPlan"],
        form: json["Form"] == null ? null : json["Form"],
        inspection: json["Inspection"] == null ? null : json["Inspection"],
        location: json["Location"] == null ? null : json["Location"],
        project: json["Project"] == null ? null : json["Project"],
        rfi: json["RFI"] == null ? null : json["RFI"],
        schedule: json["Schedule"] == null ? null : json["Schedule"],
        specification: json["Specification"] == null ? null : json["Specification"],
        submittal: json["Submittal"] == null ? null : json["Submittal"],
    );

    Map<String, dynamic> toJson() => {
        "Corporate": corporate == null ? null : corporate,
        "Directory": directory == null ? null : directory,
        "Document": document == null ? null : document,
        "DocumentPlan": documentPlan == null ? null : documentPlan,
        "Form": form == null ? null : form,
        "Inspection": inspection == null ? null : inspection,
        "Location": location == null ? null : location,
        "Project": project == null ? null : project,
        "RFI": rfi == null ? null : rfi,
        "Schedule": schedule == null ? null : schedule,
        "Specification": specification == null ? null : specification,
        "Submittal": submittal == null ? null : submittal,
    };
}

class Pro {
    Pro({
        @required this.id,
        @required this.name,
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
