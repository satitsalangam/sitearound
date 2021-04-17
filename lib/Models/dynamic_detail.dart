// To parse this JSON data, do
//
//     final dynamicDetail = dynamicDetailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DynamicDetail dynamicDetailFromJson(String str) => DynamicDetail.fromJson(json.decode(str));

String dynamicDetailToJson(DynamicDetail data) => json.encode(data.toJson());

class DynamicDetail {
    DynamicDetail({
        @required this.id,
        @required this.deleted,
        @required this.documentCode,
        @required this.process,
        @required this.title,
        @required this.dueDate,
        @required this.status,
        @required this.startDate,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.createdBy,
        @required this.documents,
        @required this.description,
    });

    int id;
    dynamic deleted;
    String documentCode;
    int process;
    String title;
    dynamic dueDate;
    int status;
    DateTime startDate;
    DateTime createdAt;
    DateTime updatedAt;
    CreatedBy createdBy;
    List<Document> documents;
    dynamic description;

    factory DynamicDetail.fromJson(Map<String, dynamic> json) => DynamicDetail(
        id: json["id"] == null ? null : json["id"],
        deleted: json["deleted"],
        documentCode: json["document_code"] == null ? null : json["document_code"],
        process: json["process"] == null ? null : json["process"],
        title: json["title"] == null ? null : json["title"],
        dueDate: json["due_date"],
        status: json["status"] == null ? null : json["status"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
        documents: json["documents"] == null ? null : List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "deleted": deleted,
        "document_code": documentCode == null ? null : documentCode,
        "process": process == null ? null : process,
        "title": title == null ? null : title,
        "due_date": dueDate,
        "status": status == null ? null : status,
        "start_date": startDate == null ? null : startDate.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "created_by": createdBy == null ? null : createdBy.toJson(),
        "documents": documents == null ? null : List<dynamic>.from(documents.map((x) => x.toJson())),
        "description": description,
    };
}

class CreatedBy {
    CreatedBy({
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

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
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

class Document {
    Document({
        @required this.id,
        @required this.managerDate,
        @required this.title,
        @required this.status,
        @required this.state,
        @required this.process,
        @required this.documentCode,
        @required this.dueDate,
        @required this.specSection,
        @required this.drawingNumber,
        @required this.costImpact,
        @required this.description,
        @required this.manager,
        @required this.createdBy,
        @required this.location,
        @required this.stateText,
        @required this.reviewer,
        @required this.rev,
        @required this.documentNumber,
        @required this.reviewStatus,
        @required this.reviewDueDate,
        @required this.reviewDate,
        @required this.submitType,
        @required this.ballInCourt,
        @required this.assignments,
    });

    int id;
    dynamic managerDate;
    String title;
    int status;
    int state;
    int process;
    String documentCode;
    DateTime dueDate;
    dynamic specSection;
    dynamic drawingNumber;
    dynamic costImpact;
    dynamic description;
    CreatedBy manager;
    CreatedBy createdBy;
    dynamic location;
    String stateText;
    String reviewer;
    dynamic rev;
    dynamic documentNumber;
    dynamic reviewStatus;
    DateTime reviewDueDate;
    dynamic reviewDate;
    dynamic submitType;
    List<String> ballInCourt;
    List<List<Assignment>> assignments;

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"] == null ? null : json["id"],
        managerDate: json["manager_date"],
        title: json["title"] == null ? null : json["title"],
        status: json["status"] == null ? null : json["status"],
        state: json["state"] == null ? null : json["state"],
        process: json["process"] == null ? null : json["process"],
        documentCode: json["document_code"] == null ? null : json["document_code"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        specSection: json["spec_section"],
        drawingNumber: json["drawing_number"],
        costImpact: json["cost_impact"],
        description: json["description"],
        manager: json["manager"] == null ? null : CreatedBy.fromJson(json["manager"]),
        createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
        location: json["location"],
        stateText: json["state_text"] == null ? null : json["state_text"],
        reviewer: json["reviewer"] == null ? null : json["reviewer"],
        rev: json["rev"],
        documentNumber: json["document_number"],
        reviewStatus: json["review_status"],
        reviewDueDate: json["review_due_date"] == null ? null : DateTime.parse(json["review_due_date"]),
        reviewDate: json["review_date"],
        submitType: json["submit_type"],
        ballInCourt: json["ball_in_court"] == null ? null : List<String>.from(json["ball_in_court"].map((x) => x)),
        assignments: json["assignments"] == null ? null : List<List<Assignment>>.from(json["assignments"].map((x) => List<Assignment>.from(x.map((x) => Assignment.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "manager_date": managerDate,
        "title": title == null ? null : title,
        "status": status == null ? null : status,
        "state": state == null ? null : state,
        "process": process == null ? null : process,
        "document_code": documentCode == null ? null : documentCode,
        "due_date": dueDate == null ? null : dueDate.toIso8601String(),
        "spec_section": specSection,
        "drawing_number": drawingNumber,
        "cost_impact": costImpact,
        "description": description,
        "manager": manager == null ? null : manager.toJson(),
        "created_by": createdBy == null ? null : createdBy.toJson(),
        "location": location,
        "state_text": stateText == null ? null : stateText,
        "reviewer": reviewer == null ? null : reviewer,
        "rev": rev,
        "document_number": documentNumber,
        "review_status": reviewStatus,
        "review_due_date": reviewDueDate == null ? null : reviewDueDate.toIso8601String(),
        "review_date": reviewDate,
        "submit_type": submitType,
        "ball_in_court": ballInCourt == null ? null : List<dynamic>.from(ballInCourt.map((x) => x)),
        "assignments": assignments == null ? null : List<dynamic>.from(assignments.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    };
}

class Assignment {
    Assignment({
        @required this.id,
        @required this.order,
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
    });

    int id;
    int order;
    DateTime dueDate;
    dynamic readedAt;
    dynamic status;
    int state;
    dynamic documentStatus;
    String username;
    String fullName;
    dynamic response;
    dynamic sendDate;
    dynamic returnedDate;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    List<dynamic> files;

    factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"] == null ? null : json["id"],
        order: json["order"] == null ? null : json["order"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        readedAt: json["readed_at"],
        status: json["status"],
        state: json["state"] == null ? null : json["state"],
        documentStatus: json["document_status"],
        username: json["username"] == null ? null : json["username"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        response: json["response"],
        sendDate: json["send_date"],
        returnedDate: json["returned_date"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        files: json["files"] == null ? null : List<dynamic>.from(json["files"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order": order == null ? null : order,
        "due_date": dueDate == null ? null : dueDate.toIso8601String(),
        "readed_at": readedAt,
        "status": status,
        "state": state == null ? null : state,
        "document_status": documentStatus,
        "username": username == null ? null : username,
        "full_name": fullName == null ? null : fullName,
        "response": response,
        "send_date": sendDate,
        "returned_date": returnedDate,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "files": files == null ? null : List<dynamic>.from(files.map((x) => x)),
    };
}
