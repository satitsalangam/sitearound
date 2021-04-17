// To parse this JSON data, do
//
//     final docRfiModel = docRfiModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DocRfiModel docRfiModelFromJson(String str) => DocRfiModel.fromJson(json.decode(str));

String docRfiModelToJson(DocRfiModel data) => json.encode(data.toJson());

class DocRfiModel {
    DocRfiModel({
        @required this.id,
        @required this.deleted,
        @required this.detail,
        @required this.files,
        @required this.title,
        @required this.status,
        @required this.managerDate,
        @required this.state,
        @required this.documentCode,
        @required this.createdAt,
        @required this.dueDate,
        @required this.approver,
        @required this.inspector,
        @required this.startDate,
        @required this.endDate,
        @required this.inspectionDueDate,
        @required this.inspectStatus,
        @required this.template,
        @required this.approvedDate,
        @required this.templateContextData,
        @required this.specSection,
        @required this.managerDueDate,
        @required this.managerComment,
        @required this.managerFile,
        @required this.drawingNumber,
        @required this.reviewer,
        @required this.manager,
        @required this.costImpact,
        @required this.scheduleImpact,
        @required this.disciplineContextData,
        @required this.discipline,
        @required this.specification,
        @required this.description,
        @required this.company,
        @required this.contractorContextData,
        @required this.location,
        @required this.assignments,
        @required this.referenceList,
        @required this.receivedFromList,
        @required this.distributionList,
        @required this.process,
        @required this.order,
        @required this.originator,
        @required this.reviewStatus,
        @required this.reviewDueDate,
        @required this.reviewDate,
        @required this.reviewTeam,
        @required this.reviewResponse,
        @required this.reviewFile,
        @required this.user,
        @required this.documentPlan,
    });

    int id;
    dynamic deleted;
    Detail detail;
    List<FileElement> files;
    String title;
    int status;
    DateTime managerDate;
    int state;
    String documentCode;
    DateTime createdAt;
    DateTime dueDate;
    dynamic approver;
    dynamic inspector;
    dynamic startDate;
    dynamic endDate;
    dynamic inspectionDueDate;
    dynamic inspectStatus;
    dynamic template;
    dynamic approvedDate;
    dynamic templateContextData;
    dynamic specSection;
    DateTime managerDueDate;
    String managerComment;
    List<dynamic> managerFile;
    String drawingNumber;
    dynamic reviewer;
    Manager manager;
    String costImpact;
    String scheduleImpact;
    DisciplineContextData disciplineContextData;
    int discipline;
    dynamic specification;
    dynamic description;
    Company company;
    Company contractorContextData;
    Location location;
    List<List<Assignment>> assignments;
    List<dynamic> referenceList;
    List<dynamic> receivedFromList;
    List<DistributionList> distributionList;
    int process;
    int order;
    dynamic originator;
    dynamic reviewStatus;
    dynamic reviewDueDate;
    dynamic reviewDate;
    dynamic reviewTeam;
    dynamic reviewResponse;
    List<dynamic> reviewFile;
    Manager user;
    dynamic documentPlan;

    factory DocRfiModel.fromJson(Map<String, dynamic> json) => DocRfiModel(
        id: json["id"] == null ? null : json["id"],
        deleted: json["deleted"],
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
        files: json["files"] == null ? null : List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
        status: json["status"] == null ? null : json["status"],
        managerDate: json["manager_date"] == null ? null : DateTime.parse(json["manager_date"]),
        state: json["state"] == null ? null : json["state"],
        documentCode: json["document_code"] == null ? null : json["document_code"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        approver: json["approver"],
        inspector: json["inspector"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        inspectionDueDate: json["inspection_due_date"],
        inspectStatus: json["inspect_status"],
        template: json["template"],
        approvedDate: json["approved_date"],
        templateContextData: json["template_context_data"],
        specSection: json["spec_section"],
        managerDueDate: json["manager_due_date"] == null ? null : DateTime.parse(json["manager_due_date"]),
        managerComment: json["manager_comment"] == null ? null : json["manager_comment"],
        managerFile: json["manager_file"] == null ? null : List<dynamic>.from(json["manager_file"].map((x) => x)),
        drawingNumber: json["drawing_number"] == null ? null : json["drawing_number"],
        reviewer: json["reviewer"],
        manager: json["manager"] == null ? null : Manager.fromJson(json["manager"]),
        costImpact: json["cost_impact"] == null ? null : json["cost_impact"],
        scheduleImpact: json["schedule_impact"] == null ? null : json["schedule_impact"],
        disciplineContextData: json["discipline_context_data"] == null ? null : DisciplineContextData.fromJson(json["discipline_context_data"]),
        discipline: json["discipline"] == null ? null : json["discipline"],
        specification: json["specification"],
        description: json["description"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        contractorContextData: json["contractor_context_data"] == null ? null : Company.fromJson(json["contractor_context_data"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        assignments: json["assignments"] == null ? null : List<List<Assignment>>.from(json["assignments"].map((x) => List<Assignment>.from(x.map((x) => Assignment.fromJson(x))))),
        referenceList: json["reference_list"] == null ? null : List<dynamic>.from(json["reference_list"].map((x) => x)),
        receivedFromList: json["received_from_list"] == null ? null : List<dynamic>.from(json["received_from_list"].map((x) => x)),
        distributionList: json["distribution_list"] == null ? null : List<DistributionList>.from(json["distribution_list"].map((x) => DistributionList.fromJson(x))),
        process: json["process"] == null ? null : json["process"],
        order: json["order"] == null ? null : json["order"],
        originator: json["originator"],
        reviewStatus: json["review_status"],
        reviewDueDate: json["review_due_date"],
        reviewDate: json["review_date"],
        reviewTeam: json["review_team"],
        reviewResponse: json["review_response"],
        reviewFile: json["review_file"] == null ? null : List<dynamic>.from(json["review_file"].map((x) => x)),
        user: json["user"] == null ? null : Manager.fromJson(json["user"]),
        documentPlan: json["document_plan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "deleted": deleted,
        "detail": detail == null ? null : detail.toJson(),
        "files": files == null ? null : List<dynamic>.from(files.map((x) => x.toJson())),
        "title": title == null ? null : title,
        "status": status == null ? null : status,
        "manager_date": managerDate == null ? null : managerDate.toIso8601String(),
        "state": state == null ? null : state,
        "document_code": documentCode == null ? null : documentCode,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "due_date": dueDate == null ? null : dueDate.toIso8601String(),
        "approver": approver,
        "inspector": inspector,
        "start_date": startDate,
        "end_date": endDate,
        "inspection_due_date": inspectionDueDate,
        "inspect_status": inspectStatus,
        "template": template,
        "approved_date": approvedDate,
        "template_context_data": templateContextData,
        "spec_section": specSection,
        "manager_due_date": managerDueDate == null ? null : managerDueDate.toIso8601String(),
        "manager_comment": managerComment == null ? null : managerComment,
        "manager_file": managerFile == null ? null : List<dynamic>.from(managerFile.map((x) => x)),
        "drawing_number": drawingNumber == null ? null : drawingNumber,
        "reviewer": reviewer,
        "manager": manager == null ? null : manager.toJson(),
        "cost_impact": costImpact == null ? null : costImpact,
        "schedule_impact": scheduleImpact == null ? null : scheduleImpact,
        "discipline_context_data": disciplineContextData == null ? null : disciplineContextData.toJson(),
        "discipline": discipline == null ? null : discipline,
        "specification": specification,
        "description": description,
        "company": company == null ? null : company.toJson(),
        "contractor_context_data": contractorContextData == null ? null : contractorContextData.toJson(),
        "location": location == null ? null : location.toJson(),
        "assignments": assignments == null ? null : List<dynamic>.from(assignments.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "reference_list": referenceList == null ? null : List<dynamic>.from(referenceList.map((x) => x)),
        "received_from_list": receivedFromList == null ? null : List<dynamic>.from(receivedFromList.map((x) => x)),
        "distribution_list": distributionList == null ? null : List<dynamic>.from(distributionList.map((x) => x.toJson())),
        "process": process == null ? null : process,
        "order": order == null ? null : order,
        "originator": originator,
        "review_status": reviewStatus,
        "review_due_date": reviewDueDate,
        "review_date": reviewDate,
        "review_team": reviewTeam,
        "review_response": reviewResponse,
        "review_file": reviewFile == null ? null : List<dynamic>.from(reviewFile.map((x) => x)),
        "user": user == null ? null : user.toJson(),
        "document_plan": documentPlan,
    };
}

class Assignment {
    Assignment({
        @required this.id,
        @required this.order,
        @required this.userId,
        @required this.dueDate,
        @required this.readedAt,
        @required this.status,
        @required this.state,
        @required this.documentStatus,
        @required this.username,
        @required this.fullName,
        @required this.response,
        @required this.sendDate,
        @required this.returnedDate,
        @required this.description,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.files,
        @required this.isOfficial,
        @required this.rejectedTo,
    });

    int id;
    int order;
    int userId;
    DateTime dueDate;
    dynamic readedAt;
    int status;
    int state;
    dynamic documentStatus;
    String username;
    String fullName;
    String response;
    DateTime sendDate;
    dynamic returnedDate;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    List<dynamic> files;
    bool isOfficial;
    dynamic rejectedTo;

    factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"] == null ? null : json["id"],
        order: json["order"] == null ? null : json["order"],
        userId: json["user_id"] == null ? null : json["user_id"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        readedAt: json["readed_at"],
        status: json["status"] == null ? null : json["status"],
        state: json["state"] == null ? null : json["state"],
        documentStatus: json["document_status"],
        username: json["username"] == null ? null : json["username"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        response: json["response"] == null ? null : json["response"],
        sendDate: json["send_date"] == null ? null : DateTime.parse(json["send_date"]),
        returnedDate: json["returned_date"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        files: json["files"] == null ? null : List<dynamic>.from(json["files"].map((x) => x)),
        isOfficial: json["is_official"] == null ? null : json["is_official"],
        rejectedTo: json["rejected_to"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order": order == null ? null : order,
        "user_id": userId == null ? null : userId,
        "due_date": dueDate == null ? null : dueDate.toIso8601String(),
        "readed_at": readedAt,
        "status": status == null ? null : status,
        "state": state == null ? null : state,
        "document_status": documentStatus,
        "username": username == null ? null : username,
        "full_name": fullName == null ? null : fullName,
        "response": response == null ? null : response,
        "send_date": sendDate == null ? null : sendDate.toIso8601String(),
        "returned_date": returnedDate,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "files": files == null ? null : List<dynamic>.from(files.map((x) => x)),
        "is_official": isOfficial == null ? null : isOfficial,
        "rejected_to": rejectedTo,
    };
}

class Company {
    Company({
        @required this.id,
        @required this.name,
        @required this.organization,
        @required this.code,
        @required this.place,
    });

    int id;
    String name;
    String organization;
    String code;
    dynamic place;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        organization: json["organization"] == null ? null : json["organization"],
        code: json["code"] == null ? null : json["code"],
        place: json["place"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "organization": organization == null ? null : organization,
        "code": code == null ? null : code,
        "place": place,
    };
}

class Detail {
    Detail();

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    );

    Map<String, dynamic> toJson() => {
    };
}

class DisciplineContextData {
    DisciplineContextData({
        @required this.id,
        @required this.name,
        @required this.createdAt,
        @required this.code,
        @required this.updatedAt,
    });

    int id;
    String name;
    DateTime createdAt;
    String code;
    DateTime updatedAt;

    factory DisciplineContextData.fromJson(Map<String, dynamic> json) => DisciplineContextData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        code: json["code"] == null ? null : json["code"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "code": code == null ? null : code,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}

class DistributionList {
    DistributionList({
        @required this.userDocId,
        @required this.id,
        @required this.userDocumentId,
        @required this.firstName,
        @required this.lastName,
        @required this.fullName,
    });

    int userDocId;
    int id;
    int userDocumentId;
    String firstName;
    String lastName;
    String fullName;

    factory DistributionList.fromJson(Map<String, dynamic> json) => DistributionList(
        userDocId: json["user_doc_id"] == null ? null : json["user_doc_id"],
        id: json["id"] == null ? null : json["id"],
        userDocumentId: json["user_document_id"] == null ? null : json["user_document_id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "user_doc_id": userDocId == null ? null : userDocId,
        "id": id == null ? null : id,
        "user_document_id": userDocumentId == null ? null : userDocumentId,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "full_name": fullName == null ? null : fullName,
    };
}

class FileElement {
    FileElement({
        @required this.documentFileId,
        @required this.id,
        @required this.name,
        @required this.type,
        @required this.path,
    });

    int documentFileId;
    int id;
    String name;
    String type;
    String path;

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        documentFileId: json["document_file_id"] == null ? null : json["document_file_id"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        path: json["path"] == null ? null : json["path"],
    );

    Map<String, dynamic> toJson() => {
        "document_file_id": documentFileId == null ? null : documentFileId,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "path": path == null ? null : path,
    };
}

class Location {
    Location({
        @required this.id,
        @required this.name,
        @required this.displayName,
        @required this.parent,
        @required this.value,
        @required this.title,
        @required this.createdAt,
        @required this.updatedAt,
    });

    int id;
    String name;
    String displayName;
    int parent;
    int value;
    String title;
    DateTime createdAt;
    DateTime updatedAt;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        parent: json["parent"] == null ? null : json["parent"],
        value: json["value"] == null ? null : json["value"],
        title: json["title"] == null ? null : json["title"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "display_name": displayName == null ? null : displayName,
        "parent": parent == null ? null : parent,
        "value": value == null ? null : value,
        "title": title == null ? null : title,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}

class Manager {
    Manager({
        @required this.id,
        @required this.email,
        @required this.username,
        @required this.company,
        @required this.firstName,
        @required this.position,
        @required this.lastName,
        @required this.fullName,
        @required this.isAcceptTerms,
        @required this.permissionCorporate,
    });

    int id;
    String email;
    String username;
    String company;
    String firstName;
    String position;
    String lastName;
    String fullName;
    bool isAcceptTerms;
    int permissionCorporate;

    factory Manager.fromJson(Map<String, dynamic> json) => Manager(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        company: json["company"] == null ? null : json["company"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        position: json["position"] == null ? null : json["position"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        isAcceptTerms: json["is_accept_terms"] == null ? null : json["is_accept_terms"],
        permissionCorporate: json["permission_corporate"] == null ? null : json["permission_corporate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "company": company == null ? null : company,
        "first_name": firstName == null ? null : firstName,
        "position": position == null ? null : position,
        "last_name": lastName == null ? null : lastName,
        "full_name": fullName == null ? null : fullName,
        "is_accept_terms": isAcceptTerms == null ? null : isAcceptTerms,
        "permission_corporate": permissionCorporate == null ? null : permissionCorporate,
    };
}
