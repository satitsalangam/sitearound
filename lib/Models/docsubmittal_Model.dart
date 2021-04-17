// To parse this JSON data, do
//
//     final docSubmittalModel = docSubmittalModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DocSubmittalModel docSubmittalModelFromJson(String str) => DocSubmittalModel.fromJson(json.decode(str));

String docSubmittalModelToJson(DocSubmittalModel data) => json.encode(data.toJson());

class DocSubmittalModel {
    DocSubmittalModel({
        @required this.id,
        @required this.rev,
        @required this.documentNumber,
        @required this.reviewStatus,
        @required this.review,
        @required this.reviewDueDate,
        @required this.submitType,
        @required this.deleted,
        @required this.files,
        @required this.title,
        @required this.status,
        @required this.managerDate,
        @required this.state,
        @required this.documentCode,
        @required this.createdAt,
        @required this.dueDate,
        @required this.template,
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
        @required this.assignments,
        @required this.referenceList,
        @required this.receivedFromList,
        @required this.distributionList,
        @required this.process,
        @required this.order,
        @required this.originator,
        @required this.reviewDate,
        @required this.reviewTeam,
        @required this.reviewResponse,
        @required this.reviewFile,
        @required this.location,
        @required this.user,
        @required this.documentPlan,
    });

    int id;
    String rev;
    String documentNumber;
    int reviewStatus;
    OriginatorClass review;
    DateTime reviewDueDate;
    dynamic submitType;
    dynamic deleted;
    List<ManagerFileElement> files;
    String title;
    int status;
    DateTime managerDate;
    int state;
    String documentCode;
    DateTime createdAt;
    DateTime dueDate;
    int template;
    TemplateContextData templateContextData;
    dynamic specSection;
    DateTime managerDueDate;
    String managerComment;
    List<ManagerFileElement> managerFile;
    String drawingNumber;
    String reviewer;
    OriginatorClass manager;
    String costImpact;
    String scheduleImpact;
    Discipline disciplineContextData;
    int discipline;
    Specification specification;
    String description;
    Company company;
    Company contractorContextData;
    List<List<DocSubmittalModelAssignment>> assignments;
    List<dynamic> referenceList;
    List<dynamic> receivedFromList;
    List<DocSubmittalModelDistributionList> distributionList;
    int process;
    int order;
    OriginatorClass originator;
    DateTime reviewDate;
    OriginatorClass reviewTeam;
    String reviewResponse;
    List<ManagerFileElement> reviewFile;
    Location location;
    OriginatorClass user;
    dynamic documentPlan;

    factory DocSubmittalModel.fromJson(Map<String, dynamic> json) => DocSubmittalModel(
        id: json["id"] == null ? null : json["id"],
        rev: json["rev"] == null ? null : json["rev"],
        documentNumber: json["document_number"] == null ? null : json["document_number"],
        reviewStatus: json["review_status"] == null ? null : json["review_status"],
        review: json["review"] == null ? null : OriginatorClass.fromJson(json["review"]),
        reviewDueDate: json["review_due_date"] == null ? null : DateTime.parse(json["review_due_date"]),
        submitType: json["submit_type"],
        deleted: json["deleted"],
        files: json["files"] == null ? null : List<ManagerFileElement>.from(json["files"].map((x) => ManagerFileElement.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
        status: json["status"] == null ? null : json["status"],
        managerDate: json["manager_date"] == null ? null : DateTime.parse(json["manager_date"]),
        state: json["state"] == null ? null : json["state"],
        documentCode: json["document_code"] == null ? null : json["document_code"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        template: json["template"] == null ? null : json["template"],
        templateContextData: json["template_context_data"] == null ? null : TemplateContextData.fromJson(json["template_context_data"]),
        specSection: json["spec_section"],
        managerDueDate: json["manager_due_date"] == null ? null : DateTime.parse(json["manager_due_date"]),
        managerComment: json["manager_comment"] == null ? null : json["manager_comment"],
        managerFile: json["manager_file"] == null ? null : List<ManagerFileElement>.from(json["manager_file"].map((x) => ManagerFileElement.fromJson(x))),
        drawingNumber: json["drawing_number"] == null ? null : json["drawing_number"],
        reviewer: json["reviewer"] == null ? null : json["reviewer"],
        manager: json["manager"] == null ? null : OriginatorClass.fromJson(json["manager"]),
        costImpact: json["cost_impact"] == null ? null : json["cost_impact"],
        scheduleImpact: json["schedule_impact"] == null ? null : json["schedule_impact"],
        disciplineContextData: json["discipline_context_data"] == null ? null : Discipline.fromJson(json["discipline_context_data"]),
        discipline: json["discipline"] == null ? null : json["discipline"],
        specification: json["specification"] == null ? null : Specification.fromJson(json["specification"]),
        description: json["description"] == null ? null : json["description"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        contractorContextData: json["contractor_context_data"] == null ? null : Company.fromJson(json["contractor_context_data"]),
        assignments: json["assignments"] == null ? null : List<List<DocSubmittalModelAssignment>>.from(json["assignments"].map((x) => List<DocSubmittalModelAssignment>.from(x.map((x) => DocSubmittalModelAssignment.fromJson(x))))),
        referenceList: json["reference_list"] == null ? null : List<dynamic>.from(json["reference_list"].map((x) => x)),
        receivedFromList: json["received_from_list"] == null ? null : List<dynamic>.from(json["received_from_list"].map((x) => x)),
        distributionList: json["distribution_list"] == null ? null : List<DocSubmittalModelDistributionList>.from(json["distribution_list"].map((x) => DocSubmittalModelDistributionList.fromJson(x))),
        process: json["process"] == null ? null : json["process"],
        order: json["order"] == null ? null : json["order"],
        originator: json["originator"] == null ? null : OriginatorClass.fromJson(json["originator"]),
        reviewDate: json["review_date"] == null ? null : DateTime.parse(json["review_date"]),
        reviewTeam: json["review_team"] == null ? null : OriginatorClass.fromJson(json["review_team"]),
        reviewResponse: json["review_response"] == null ? null : json["review_response"],
        reviewFile: json["review_file"] == null ? null : List<ManagerFileElement>.from(json["review_file"].map((x) => ManagerFileElement.fromJson(x))),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        user: json["user"] == null ? null : OriginatorClass.fromJson(json["user"]),
        documentPlan: json["document_plan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "rev": rev == null ? null : rev,
        "document_number": documentNumber == null ? null : documentNumber,
        "review_status": reviewStatus == null ? null : reviewStatus,
        "review": review == null ? null : review.toJson(),
        "review_due_date": reviewDueDate == null ? null : reviewDueDate.toIso8601String(),
        "submit_type": submitType,
        "deleted": deleted,
        "files": files == null ? null : List<dynamic>.from(files.map((x) => x.toJson())),
        "title": title == null ? null : title,
        "status": status == null ? null : status,
        "manager_date": managerDate == null ? null : managerDate.toIso8601String(),
        "state": state == null ? null : state,
        "document_code": documentCode == null ? null : documentCode,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "due_date": dueDate == null ? null : dueDate.toIso8601String(),
        "template": template == null ? null : template,
        "template_context_data": templateContextData == null ? null : templateContextData.toJson(),
        "spec_section": specSection,
        "manager_due_date": managerDueDate == null ? null : managerDueDate.toIso8601String(),
        "manager_comment": managerComment == null ? null : managerComment,
        "manager_file": managerFile == null ? null : List<dynamic>.from(managerFile.map((x) => x.toJson())),
        "drawing_number": drawingNumber == null ? null : drawingNumber,
        "reviewer": reviewer == null ? null : reviewer,
        "manager": manager == null ? null : manager.toJson(),
        "cost_impact": costImpact == null ? null : costImpact,
        "schedule_impact": scheduleImpact == null ? null : scheduleImpact,
        "discipline_context_data": disciplineContextData == null ? null : disciplineContextData.toJson(),
        "discipline": discipline == null ? null : discipline,
        "specification": specification == null ? null : specification.toJson(),
        "description": description == null ? null : description,
        "company": company == null ? null : company.toJson(),
        "contractor_context_data": contractorContextData == null ? null : contractorContextData.toJson(),
        "assignments": assignments == null ? null : List<dynamic>.from(assignments.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "reference_list": referenceList == null ? null : List<dynamic>.from(referenceList.map((x) => x)),
        "received_from_list": receivedFromList == null ? null : List<dynamic>.from(receivedFromList.map((x) => x)),
        "distribution_list": distributionList == null ? null : List<dynamic>.from(distributionList.map((x) => x.toJson())),
        "process": process == null ? null : process,
        "order": order == null ? null : order,
        "originator": originator == null ? null : originator.toJson(),
        "review_date": reviewDate == null ? null : reviewDate.toIso8601String(),
        "review_team": reviewTeam == null ? null : reviewTeam.toJson(),
        "review_response": reviewResponse == null ? null : reviewResponse,
        "review_file": reviewFile == null ? null : List<dynamic>.from(reviewFile.map((x) => x.toJson())),
        "location": location == null ? null : location.toJson(),
        "user": user == null ? null : user.toJson(),
        "document_plan": documentPlan,
    };
}

class DocSubmittalModelAssignment {
    DocSubmittalModelAssignment({
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
    List<AssignmentFile> files;
    bool isOfficial;
    String rejectedTo;

    factory DocSubmittalModelAssignment.fromJson(Map<String, dynamic> json) => DocSubmittalModelAssignment(
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
        files: json["files"] == null ? null : List<AssignmentFile>.from(json["files"].map((x) => AssignmentFile.fromJson(x))),
        isOfficial: json["is_official"] == null ? null : json["is_official"],
        rejectedTo: json["rejected_to"] == null ? null : json["rejected_to"],
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
        "files": files == null ? null : List<dynamic>.from(files.map((x) => x.toJson())),
        "is_official": isOfficial == null ? null : isOfficial,
        "rejected_to": rejectedTo == null ? null : rejectedTo,
    };
}

class AssignmentFile {
    AssignmentFile({
        @required this.assignmentFileId,
        @required this.id,
        @required this.name,
        @required this.fileType,
        @required this.path,
    });

    int assignmentFileId;
    int id;
    String name;
    String fileType;
    String path;

    factory AssignmentFile.fromJson(Map<String, dynamic> json) => AssignmentFile(
        assignmentFileId: json["assignment_file_id"] == null ? null : json["assignment_file_id"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        fileType: json["file_type"] == null ? null : json["file_type"],
        path: json["path"] == null ? null : json["path"],
    );

    Map<String, dynamic> toJson() => {
        "assignment_file_id": assignmentFileId == null ? null : assignmentFileId,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "file_type": fileType == null ? null : fileType,
        "path": path == null ? null : path,
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
    Place place;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        organization: json["organization"] == null ? null : json["organization"],
        code: json["code"] == null ? null : json["code"],
        place: json["place"] == null ? null : Place.fromJson(json["place"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "organization": organization == null ? null : organization,
        "code": code == null ? null : code,
        "place": place == null ? null : place.toJson(),
    };
}

class Place {
    Place({
        @required this.id,
        @required this.country,
        @required this.timeZone,
        @required this.address,
        @required this.state,
        @required this.city,
        @required this.postcode,
        @required this.latitude,
        @required this.longitude,
        @required this.zone,
        @required this.phone,
    });

    int id;
    String country;
    String timeZone;
    String address;
    String state;
    String city;
    String postcode;
    String latitude;
    String longitude;
    String zone;
    String phone;

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"] == null ? null : json["id"],
        country: json["country"] == null ? null : json["country"],
        timeZone: json["time_zone"] == null ? null : json["time_zone"],
        address: json["address"] == null ? null : json["address"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        zone: json["zone"] == null ? null : json["zone"],
        phone: json["phone"] == null ? null : json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "country": country == null ? null : country,
        "time_zone": timeZone == null ? null : timeZone,
        "address": address == null ? null : address,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "postcode": postcode == null ? null : postcode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "zone": zone == null ? null : zone,
        "phone": phone == null ? null : phone,
    };
}

class Discipline {
    Discipline({
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

    factory Discipline.fromJson(Map<String, dynamic> json) => Discipline(
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

class DocSubmittalModelDistributionList {
    DocSubmittalModelDistributionList({
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

    factory DocSubmittalModelDistributionList.fromJson(Map<String, dynamic> json) => DocSubmittalModelDistributionList(
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

class ManagerFileElement {
    ManagerFileElement({
        @required this.documentFileId,
        @required this.id,
        @required this.name,
        @required this.type,
        @required this.path,
        @required this.managerFileId,
        @required this.initiatorFileId,
    });

    int documentFileId;
    int id;
    String name;
    String type;
    String path;
    int managerFileId;
    int initiatorFileId;

    factory ManagerFileElement.fromJson(Map<String, dynamic> json) => ManagerFileElement(
        documentFileId: json["document_file_id"] == null ? null : json["document_file_id"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        path: json["path"] == null ? null : json["path"],
        managerFileId: json["manager_file_id"] == null ? null : json["manager_file_id"],
        initiatorFileId: json["initiator_file_id"] == null ? null : json["initiator_file_id"],
    );

    Map<String, dynamic> toJson() => {
        "document_file_id": documentFileId == null ? null : documentFileId,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "path": path == null ? null : path,
        "manager_file_id": managerFileId == null ? null : managerFileId,
        "initiator_file_id": initiatorFileId == null ? null : initiatorFileId,
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

class OriginatorClass {
    OriginatorClass({
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

    factory OriginatorClass.fromJson(Map<String, dynamic> json) => OriginatorClass(
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

class Specification {
    Specification({
        @required this.id,
        @required this.code,
        @required this.name,
        @required this.value,
        @required this.title,
        @required this.parent,
    });

    int id;
    String code;
    String name;
    int value;
    String title;
    int parent;

    factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
        title: json["title"] == null ? null : json["title"],
        parent: json["parent"] == null ? null : json["parent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "name": name == null ? null : name,
        "value": value == null ? null : value,
        "title": title == null ? null : title,
        "parent": parent == null ? null : parent,
    };
}

class TemplateContextData {
    TemplateContextData({
        @required this.id,
        @required this.source,
        @required this.templateType,
        @required this.name,
        @required this.description,
        @required this.discipline,
        @required this.createdAt,
        @required this.updatedAt,
    });

    int id;
    Source source;
    int templateType;
    String name;
    String description;
    Discipline discipline;
    DateTime createdAt;
    DateTime updatedAt;

    factory TemplateContextData.fromJson(Map<String, dynamic> json) => TemplateContextData(
        id: json["id"] == null ? null : json["id"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        templateType: json["template_type"] == null ? null : json["template_type"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        discipline: json["discipline"] == null ? null : Discipline.fromJson(json["discipline"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "source": source == null ? null : source.toJson(),
        "template_type": templateType == null ? null : templateType,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "discipline": discipline == null ? null : discipline.toJson(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}

class Source {
    Source({
        @required this.manager,
        @required this.assignments,
        @required this.reviewTeam,
        @required this.distributionList,
    });

    SourceManager manager;
    List<SourceAssignment> assignments;
    SourceManager reviewTeam;
    List<SourceDistributionList> distributionList;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        manager: json["manager"] == null ? null : SourceManager.fromJson(json["manager"]),
        assignments: json["assignments"] == null ? null : List<SourceAssignment>.from(json["assignments"].map((x) => SourceAssignment.fromJson(x))),
        reviewTeam: json["review_team"] == null ? null : SourceManager.fromJson(json["review_team"]),
        distributionList: json["distribution_list"] == null ? null : List<SourceDistributionList>.from(json["distribution_list"].map((x) => SourceDistributionList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "manager": manager == null ? null : manager.toJson(),
        "assignments": assignments == null ? null : List<dynamic>.from(assignments.map((x) => x.toJson())),
        "review_team": reviewTeam == null ? null : reviewTeam.toJson(),
        "distribution_list": distributionList == null ? null : List<dynamic>.from(distributionList.map((x) => x.toJson())),
    };
}

class SourceAssignment {
    SourceAssignment({
        @required this.day,
        @required this.order,
        @required this.state,
        @required this.users,
        @required this.description,
        @required this.rejectedTo,
    });

    int day;
    int order;
    int state;
    List<User> users;
    String description;
    String rejectedTo;

    factory SourceAssignment.fromJson(Map<String, dynamic> json) => SourceAssignment(
        day: json["day"] == null ? null : json["day"],
        order: json["order"] == null ? null : json["order"],
        state: json["state"] == null ? null : json["state"],
        users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromJson(x))),
        description: json["description"] == null ? null : json["description"],
        rejectedTo: json["rejected_to"] == null ? null : json["rejected_to"],
    );

    Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "order": order == null ? null : order,
        "state": state == null ? null : state,
        "users": users == null ? null : List<dynamic>.from(users.map((x) => x.toJson())),
        "description": description == null ? null : description,
        "rejected_to": rejectedTo == null ? null : rejectedTo,
    };
}

class User {
    User({
        @required this.id,
    });

    int id;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
    };
}

class SourceDistributionList {
    SourceDistributionList({
        @required this.id,
        @required this.name,
        @required this.role,
        @required this.email,
        @required this.label,
        @required this.value,
        @required this.active,
        @required this.company,
        @required this.joinAt,
        @required this.position,
        @required this.username,
        @required this.fullName,
        @required this.lastName,
        @required this.createdAt,
        @required this.createdBy,
        @required this.firstName,
        @required this.lastLogin,
        @required this.updatedAt,
        @required this.permissions,
        @required this.organization,
        @required this.projectUserId,
        @required this.organizationName,
    });

    int id;
    String name;
    Role role;
    String email;
    String label;
    int value;
    bool active;
    Company company;
    DateTime joinAt;
    String position;
    String username;
    String fullName;
    String lastName;
    DateTime createdAt;
    dynamic createdBy;
    String firstName;
    DateTime lastLogin;
    DateTime updatedAt;
    Permissions permissions;
    int organization;
    int projectUserId;
    String organizationName;

    factory SourceDistributionList.fromJson(Map<String, dynamic> json) => SourceDistributionList(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        email: json["email"] == null ? null : json["email"],
        label: json["label"] == null ? null : json["label"],
        value: json["value"] == null ? null : json["value"],
        active: json["active"] == null ? null : json["active"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        joinAt: json["join_at"] == null ? null : DateTime.parse(json["join_at"]),
        position: json["position"] == null ? null : json["position"],
        username: json["username"] == null ? null : json["username"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        permissions: json["permissions"] == null ? null : Permissions.fromJson(json["permissions"]),
        organization: json["organization"] == null ? null : json["organization"],
        projectUserId: json["project_user_id"] == null ? null : json["project_user_id"],
        organizationName: json["organization_name"] == null ? null : json["organization_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "role": role == null ? null : role.toJson(),
        "email": email == null ? null : email,
        "label": label == null ? null : label,
        "value": value == null ? null : value,
        "active": active == null ? null : active,
        "company": company == null ? null : company.toJson(),
        "join_at": joinAt == null ? null : joinAt.toIso8601String(),
        "position": position == null ? null : position,
        "username": username == null ? null : username,
        "full_name": fullName == null ? null : fullName,
        "last_name": lastName == null ? null : lastName,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "created_by": createdBy,
        "first_name": firstName == null ? null : firstName,
        "last_login": lastLogin == null ? null : lastLogin.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "permissions": permissions == null ? null : permissions.toJson(),
        "organization": organization == null ? null : organization,
        "project_user_id": projectUserId == null ? null : projectUserId,
        "organization_name": organizationName == null ? null : organizationName,
    };
}

class Permissions {
    Permissions({
        @required this.rfi,
        @required this.form,
        @required this.project,
        @required this.document,
        @required this.location,
        @required this.schedule,
        @required this.corporate,
        @required this.directory,
        @required this.submittal,
        @required this.inspection,
        @required this.documentPlan,
        @required this.specification,
    });

    int rfi;
    int form;
    int project;
    int document;
    int location;
    int schedule;
    int corporate;
    int directory;
    int submittal;
    int inspection;
    int documentPlan;
    int specification;

    factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        rfi: json["RFI"] == null ? null : json["RFI"],
        form: json["Form"] == null ? null : json["Form"],
        project: json["Project"] == null ? null : json["Project"],
        document: json["Document"] == null ? null : json["Document"],
        location: json["Location"] == null ? null : json["Location"],
        schedule: json["Schedule"] == null ? null : json["Schedule"],
        corporate: json["Corporate"] == null ? null : json["Corporate"],
        directory: json["Directory"] == null ? null : json["Directory"],
        submittal: json["Submittal"] == null ? null : json["Submittal"],
        inspection: json["Inspection"] == null ? null : json["Inspection"],
        documentPlan: json["DocumentPlan"] == null ? null : json["DocumentPlan"],
        specification: json["Specification"] == null ? null : json["Specification"],
    );

    Map<String, dynamic> toJson() => {
        "RFI": rfi == null ? null : rfi,
        "Form": form == null ? null : form,
        "Project": project == null ? null : project,
        "Document": document == null ? null : document,
        "Location": location == null ? null : location,
        "Schedule": schedule == null ? null : schedule,
        "Corporate": corporate == null ? null : corporate,
        "Directory": directory == null ? null : directory,
        "Submittal": submittal == null ? null : submittal,
        "Inspection": inspection == null ? null : inspection,
        "DocumentPlan": documentPlan == null ? null : documentPlan,
        "Specification": specification == null ? null : specification,
    };
}

class Role {
    Role({
        @required this.id,
        @required this.name,
        @required this.activeUser,
        @required this.inactiveUser,
    });

    int id;
    String name;
    int activeUser;
    int inactiveUser;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        activeUser: json["active_user"] == null ? null : json["active_user"],
        inactiveUser: json["inactive_user"] == null ? null : json["inactive_user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "active_user": activeUser == null ? null : activeUser,
        "inactive_user": inactiveUser == null ? null : inactiveUser,
    };
}

class SourceManager {
    SourceManager({
        @required this.id,
        @required this.day,
    });

    String id;
    String day;

    factory SourceManager.fromJson(Map<String, dynamic> json) => SourceManager(
        id: json["id"] == null ? null : json["id"],
        day: json["day"] == null ? null : json["day"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "day": day == null ? null : day,
    };
}
