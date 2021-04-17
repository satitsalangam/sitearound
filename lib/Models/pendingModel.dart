// To parse this JSON data, do
//
//     final pendingModel = pendingModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PendingModel pendingModelFromJson(String str) => PendingModel.fromJson(json.decode(str));

String pendingModelToJson(PendingModel data) => json.encode(data.toJson());

class PendingModel {
    PendingModel({
        @required this.count,
        @required this.page,
        @required this.result,
    });

    int count;
    int page;
    List<Result> result;

    factory PendingModel.fromJson(Map<String, dynamic> json) => PendingModel(
        count: json["count"] == null ? null : json["count"],
        page: json["page"] == null ? null : json["page"],
        result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "page": page == null ? null : page,
        "result": result == null ? null : List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        @required this.id,
        @required this.process,
        @required this.assignments,
        @required this.status,
        @required this.order,
        @required this.state,
        @required this.createdBy,
        @required this.title,
        @required this.manager,
        @required this.managerDueDate,
        @required this.documentCode,
        @required this.dueDate,
        @required this.specification,
        @required this.template,
        @required this.documentPlan,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.rev,
        @required this.documentNumber,
        @required this.submitType,
        @required this.review,
        @required this.reviewStatus,
        @required this.reviewDueDate,
        @required this.reviewDate,
        @required this.userInDocument,
        @required this.ballInCourt,
    });

    int id;
    int process;
    List<List<ResultAssignment>> assignments;
    int status;
    int order;
    String state;
    CreatedBy createdBy;
    String title;
    CreatedBy manager;
    DateTime managerDueDate;
    String documentCode;
    DateTime dueDate;
    dynamic specification;
    Template template;
    DocumentPlan documentPlan;
    DateTime createdAt;
    DateTime updatedAt;
    String rev;
    String documentNumber;
    dynamic submitType;
    Review review;
    dynamic reviewStatus;
    DateTime reviewDueDate;
    dynamic reviewDate;
    String userInDocument;
    List<Review> ballInCourt;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        process: json["process"] == null ? null : json["process"],
        assignments: json["assignments"] == null ? null : List<List<ResultAssignment>>.from(json["assignments"].map((x) => List<ResultAssignment>.from(x.map((x) => ResultAssignment.fromJson(x))))),
        status: json["status"] == null ? null : json["status"],
        order: json["order"] == null ? null : json["order"],
        state: json["state"] == null ? null : json["state"],
        createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
        title: json["title"] == null ? null : json["title"],
        manager: json["manager"] == null ? null : CreatedBy.fromJson(json["manager"]),
        managerDueDate: json["manager_due_date"] == null ? null : DateTime.parse(json["manager_due_date"]),
        documentCode: json["document_code"] == null ? null : json["document_code"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        specification: json["specification"],
        template: json["template"] == null ? null : Template.fromJson(json["template"]),
        documentPlan: json["document_plan"] == null ? null : DocumentPlan.fromJson(json["document_plan"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        rev: json["rev"] == null ? null : json["rev"],
        documentNumber: json["document_number"] == null ? null : json["document_number"],
        submitType: json["submit_type"],
        review: json["review"] == null ? null : reviewValues.map[json["review"]],
        reviewStatus: json["review_status"],
        reviewDueDate: json["review_due_date"] == null ? null : DateTime.parse(json["review_due_date"]),
        reviewDate: json["review_date"],
        userInDocument: json["user_in_document"] == null ? null : json["user_in_document"],
        ballInCourt: json["ball_in_court"] == null ? null : List<Review>.from(json["ball_in_court"].map((x) => reviewValues.map[x])),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "process": process == null ? null : process,
        "assignments": assignments == null ? null : List<dynamic>.from(assignments.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "status": status == null ? null : status,
        "order": order == null ? null : order,
        "state": state == null ? null : state,
        "created_by": createdBy == null ? null : createdBy.toJson(),
        "title": title == null ? null : title,
        "manager": manager == null ? null : manager.toJson(),
        "manager_due_date": managerDueDate == null ? null : managerDueDate.toIso8601String(),
        "document_code": documentCode == null ? null : documentCode,
        "due_date": dueDate == null ? null : dueDate.toIso8601String(),
        "specification": specification,
        "template": template == null ? null : template.toJson(),
        "document_plan": documentPlan == null ? null : documentPlan.toJson(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "rev": rev == null ? null : rev,
        "document_number": documentNumber == null ? null : documentNumber,
        "submit_type": submitType,
        "review": review == null ? null : reviewValues.reverse[review],
        "review_status": reviewStatus,
        "review_due_date": reviewDueDate == null ? null : reviewDueDate.toIso8601String(),
        "review_date": reviewDate,
        "user_in_document": userInDocument == null ? null : userInDocument,
        "ball_in_court": ballInCourt == null ? null : List<dynamic>.from(ballInCourt.map((x) => reviewValues.reverse[x])),
    };
}

class ResultAssignment {
    ResultAssignment({
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
    int status;
    int state;
    dynamic documentStatus;
    Username username;
    Review fullName;
    String response;
    DateTime sendDate;
    dynamic returnedDate;
    Description description;
    DateTime createdAt;
    DateTime updatedAt;
    List<FileElement> files;

    factory ResultAssignment.fromJson(Map<String, dynamic> json) => ResultAssignment(
        id: json["id"] == null ? null : json["id"],
        order: json["order"] == null ? null : json["order"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        readedAt: json["readed_at"],
        status: json["status"] == null ? null : json["status"],
        state: json["state"] == null ? null : json["state"],
        documentStatus: json["document_status"],
        username: json["username"] == null ? null : usernameValues.map[json["username"]],
        fullName: json["full_name"] == null ? null : reviewValues.map[json["full_name"]],
        response: json["response"] == null ? null : json["response"],
        sendDate: json["send_date"] == null ? null : DateTime.parse(json["send_date"]),
        returnedDate: json["returned_date"],
        description: json["description"] == null ? null : descriptionValues.map[json["description"]],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        files: json["files"] == null ? null : List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order": order == null ? null : order,
        "due_date": dueDate == null ? null : dueDate.toIso8601String(),
        "readed_at": readedAt,
        "status": status == null ? null : status,
        "state": state == null ? null : state,
        "document_status": documentStatus,
        "username": username == null ? null : usernameValues.reverse[username],
        "full_name": fullName == null ? null : reviewValues.reverse[fullName],
        "response": response == null ? null : response,
        "send_date": sendDate == null ? null : sendDate.toIso8601String(),
        "returned_date": returnedDate,
        "description": description == null ? null : descriptionValues.reverse[description],
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "files": files == null ? null : List<dynamic>.from(files.map((x) => x.toJson())),
    };
}

enum Description { EMPTY, DESCRIPTION }

final descriptionValues = EnumValues({
    "": Description.DESCRIPTION,
    "-": Description.EMPTY
});

class FileElement {
    FileElement({
        @required this.id,
        @required this.name,
        @required this.type,
        @required this.path,
    });

    int id;
    String name;
    String type;
    String path;

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        path: json["path"] == null ? null : json["path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "path": path == null ? null : path,
    };
}

enum Review { ASSIGNEE_11, DISTRIBUTOR_NAJA, SUPERADMIN_SWIFT_DYNAMICS, SAPJARERN_UDOMVIRIYALANON }

final reviewValues = EnumValues({
    "Assignee 1.1": Review.ASSIGNEE_11,
    "Distributor Naja": Review.DISTRIBUTOR_NAJA,
    "Sapjarern Udomviriyalanon": Review.SAPJARERN_UDOMVIRIYALANON,
    "Superadmin swift-dynamics": Review.SUPERADMIN_SWIFT_DYNAMICS
});

enum Username { LSUPASIN_GMAIL_COM, MTSUPASIN_GMAIL_COM, SUPERADMIN, SAPJARERN081_GMAIL_COM }

final usernameValues = EnumValues({
    "lsupasin@gmail.com": Username.LSUPASIN_GMAIL_COM,
    "mtsupasin@gmail.com": Username.MTSUPASIN_GMAIL_COM,
    "sapjarern081@gmail.com": Username.SAPJARERN081_GMAIL_COM,
    "superadmin": Username.SUPERADMIN
});

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
    Username username;
    String company;
    String firstName;
    String position;
    String lastName;
    Review fullName;
    bool isAcceptTerms;
    int permissionCorporate;

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : usernameValues.map[json["username"]],
        company: json["company"] == null ? null : json["company"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        position: json["position"] == null ? null : json["position"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        fullName: json["full_name"] == null ? null : reviewValues.map[json["full_name"]],
        isAcceptTerms: json["is_accept_terms"] == null ? null : json["is_accept_terms"],
        permissionCorporate: json["permission_corporate"] == null ? null : json["permission_corporate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "username": username == null ? null : usernameValues.reverse[username],
        "company": company == null ? null : company,
        "first_name": firstName == null ? null : firstName,
        "position": position == null ? null : position,
        "last_name": lastName == null ? null : lastName,
        "full_name": fullName == null ? null : reviewValues.reverse[fullName],
        "is_accept_terms": isAcceptTerms == null ? null : isAcceptTerms,
        "permission_corporate": permissionCorporate == null ? null : permissionCorporate,
    };
}

class DocumentPlan {
    DocumentPlan({
        @required this.id,
        @required this.documentCode,
        @required this.status,
        @required this.process,
        @required this.dueDate,
        @required this.startDate,
        @required this.project,
        @required this.order,
    });

    int id;
    String documentCode;
    int status;
    int process;
    dynamic dueDate;
    DateTime startDate;
    String project;
    int order;

    factory DocumentPlan.fromJson(Map<String, dynamic> json) => DocumentPlan(
        id: json["id"] == null ? null : json["id"],
        documentCode: json["document_code"] == null ? null : json["document_code"],
        status: json["status"] == null ? null : json["status"],
        process: json["process"] == null ? null : json["process"],
        dueDate: json["due_date"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        project: json["project"] == null ? null : json["project"],
        order: json["order"] == null ? null : json["order"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "document_code": documentCode == null ? null : documentCode,
        "status": status == null ? null : status,
        "process": process == null ? null : process,
        "due_date": dueDate,
        "start_date": startDate == null ? null : startDate.toIso8601String(),
        "project": project == null ? null : project,
        "order": order == null ? null : order,
    };
}

class Template {
    Template({
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
    dynamic description;
    Discipline discipline;
    DateTime createdAt;
    DateTime updatedAt;

    factory Template.fromJson(Map<String, dynamic> json) => Template(
        id: json["id"] == null ? null : json["id"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        templateType: json["template_type"] == null ? null : json["template_type"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"],
        discipline: json["discipline"] == null ? null : Discipline.fromJson(json["discipline"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "source": source == null ? null : source.toJson(),
        "template_type": templateType == null ? null : templateType,
        "name": name == null ? null : name,
        "description": description,
        "discipline": discipline == null ? null : discipline.toJson(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
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

class Source {
    Source({
        @required this.manager,
        @required this.assignments,
        @required this.reviewTeam,
        @required this.distributionList,
    });

    Manager manager;
    List<SourceAssignment> assignments;
    Manager reviewTeam;
    List<DistributionList> distributionList;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        manager: json["manager"] == null ? null : Manager.fromJson(json["manager"]),
        assignments: json["assignments"] == null ? null : List<SourceAssignment>.from(json["assignments"].map((x) => SourceAssignment.fromJson(x))),
        reviewTeam: json["review_team"] == null ? null : Manager.fromJson(json["review_team"]),
        distributionList: json["distribution_list"] == null ? null : List<DistributionList>.from(json["distribution_list"].map((x) => DistributionList.fromJson(x))),
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
    Description description;
    String rejectedTo;

    factory SourceAssignment.fromJson(Map<String, dynamic> json) => SourceAssignment(
        day: json["day"] == null ? null : json["day"],
        order: json["order"] == null ? null : json["order"],
        state: json["state"] == null ? null : json["state"],
        users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromJson(x))),
        description: json["description"] == null ? null : descriptionValues.map[json["description"]],
        rejectedTo: json["rejected_to"] == null ? null : json["rejected_to"],
    );

    Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "order": order == null ? null : order,
        "state": state == null ? null : state,
        "users": users == null ? null : List<dynamic>.from(users.map((x) => x.toJson())),
        "description": description == null ? null : descriptionValues.reverse[description],
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

class DistributionList {
    DistributionList({
        @required this.id,
        @required this.fax,
        @required this.city,
        @required this.name,
        @required this.role,
        @required this.zone,
        @required this.email,
        @required this.label,
        @required this.phone,
        @required this.state,
        @required this.value,
        @required this.active,
        @required this.address,
        @required this.company,
        @required this.country,
        @required this.joinAt,
        @required this.latitude,
        @required this.position,
        @required this.postcode,
        @required this.username,
        @required this.fullName,
        @required this.lastName,
        @required this.longitude,
        @required this.timeZone,
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
    String fax;
    String city;
    String name;
    Role role;
    String zone;
    String email;
    String label;
    String phone;
    String state;
    int value;
    bool active;
    String address;
    Company company;
    String country;
    DateTime joinAt;
    String latitude;
    String position;
    String postcode;
    String username;
    String fullName;
    String lastName;
    String longitude;
    String timeZone;
    DateTime createdAt;
    Review createdBy;
    String firstName;
    DateTime lastLogin;
    DateTime updatedAt;
    Permissions permissions;
    int organization;
    int projectUserId;
    String organizationName;

    factory DistributionList.fromJson(Map<String, dynamic> json) => DistributionList(
        id: json["id"] == null ? null : json["id"],
        fax: json["fax"] == null ? null : json["fax"],
        city: json["city"] == null ? null : json["city"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        zone: json["zone"] == null ? null : json["zone"],
        email: json["email"] == null ? null : json["email"],
        label: json["label"] == null ? null : json["label"],
        phone: json["phone"] == null ? null : json["phone"],
        state: json["state"] == null ? null : json["state"],
        value: json["value"] == null ? null : json["value"],
        active: json["active"] == null ? null : json["active"],
        address: json["address"] == null ? null : json["address"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        country: json["country"] == null ? null : json["country"],
        joinAt: json["join_at"] == null ? null : DateTime.parse(json["join_at"]),
        latitude: json["latitude"] == null ? null : json["latitude"],
        position: json["position"] == null ? null : json["position"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        username: json["username"] == null ? null : json["username"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        timeZone: json["time_zone"] == null ? null : json["time_zone"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"] == null ? null : reviewValues.map[json["created_by"]],
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
        "fax": fax == null ? null : fax,
        "city": city == null ? null : city,
        "name": name == null ? null : name,
        "role": role == null ? null : role.toJson(),
        "zone": zone == null ? null : zone,
        "email": email == null ? null : email,
        "label": label == null ? null : label,
        "phone": phone == null ? null : phone,
        "state": state == null ? null : state,
        "value": value == null ? null : value,
        "active": active == null ? null : active,
        "address": address == null ? null : address,
        "company": company == null ? null : company.toJson(),
        "country": country == null ? null : country,
        "join_at": joinAt == null ? null : joinAt.toIso8601String(),
        "latitude": latitude == null ? null : latitude,
        "position": position == null ? null : position,
        "postcode": postcode == null ? null : postcode,
        "username": username == null ? null : username,
        "full_name": fullName == null ? null : fullName,
        "last_name": lastName == null ? null : lastName,
        "longitude": longitude == null ? null : longitude,
        "time_zone": timeZone == null ? null : timeZone,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "created_by": createdBy == null ? null : reviewValues.reverse[createdBy],
        "first_name": firstName == null ? null : firstName,
        "last_login": lastLogin == null ? null : lastLogin.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "permissions": permissions == null ? null : permissions.toJson(),
        "organization": organization == null ? null : organization,
        "project_user_id": projectUserId == null ? null : projectUserId,
        "organization_name": organizationName == null ? null : organizationName,
    };
}

class Company {
    Company({
        @required this.id,
        @required this.code,
        @required this.name,
        @required this.organization,
    });

    int id;
    String code;
    String name;
    String organization;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
        organization: json["organization"] == null ? null : json["organization"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "name": name == null ? null : name,
        "organization": organization == null ? null : organization,
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

class Manager {
    Manager({
        @required this.id,
        @required this.day,
    });

    String id;
    String day;

    factory Manager.fromJson(Map<String, dynamic> json) => Manager(
        id: json["id"] == null ? null : json["id"],
        day: json["day"] == null ? null : json["day"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "day": day == null ? null : day,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
