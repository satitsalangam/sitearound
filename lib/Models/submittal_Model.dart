// To parse this JSON data, do
//
//     final sumittalModel = sumittalModelFromJson(jsonString);

import 'dart:convert';

SumittalModel sumittalModelFromJson(String str) =>
    SumittalModel.fromJson(json.decode(str));

String sumittalModelToJson(SumittalModel data) => json.encode(data.toJson());

class SumittalModel {
  SumittalModel({
    this.result,
    this.count,
    this.page,
  });

  List<Result> result;
  int count;
  int page;

  factory SumittalModel.fromJson(Map<String, dynamic> json) => SumittalModel(
        result: json["result"] == null
            ? null
            : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        count: json["count"] == null ? null : json["count"],
        page: json["page"] == null ? null : json["page"],
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? null
            : List<dynamic>.from(result.map((x) => x.toJson())),
        "count": count == null ? null : count,
        "page": page == null ? null : page,
      };
}

class Result {
  Result({
    this.id,
    this.managerDate,
    this.title,
    this.status,
    this.state,
    this.process,
    this.documentCode,
    this.dueDate,
    this.updatedAt,
    this.specSection,
    this.drawingNumber,
    this.costImpact,
    this.description,
    this.manager,
    this.createdBy,
    this.location,
    this.reviewer,
    this.rev,
    this.documentNumber,
    this.reviewStatus,
    this.reviewDueDate,
    this.reviewDate,
    this.submitType,
    this.ballInCourt,
    this.assignments,
  });

  int id;
  DateTime managerDate;
  String title;
  int status;
  int state;
  int process;
  String documentCode;
  DateTime dueDate;
  DateTime updatedAt;
  dynamic specSection;
  String drawingNumber;
  String costImpact;
  String description;
  CreatedBy manager;
  CreatedBy createdBy;
  int location;
  Reviewer reviewer;
  String rev;
  String documentNumber;
  int reviewStatus;
  DateTime reviewDueDate;
  DateTime reviewDate;
  dynamic submitType;
  List<Reviewer> ballInCourt;
  List<List<Assignment>> assignments;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        managerDate: json["manager_date"] == null
            ? null
            : DateTime.parse(json["manager_date"]),
        title: json["title"] == null ? null : json["title"],
        status: json["status"] == null ? null : json["status"],
        state: json["state"] == null ? null : json["state"],
        process: json["process"] == null ? null : json["process"],
        documentCode:
            json["document_code"] == null ? null : json["document_code"],
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        specSection: json["spec_section"],
        drawingNumber:
            json["drawing_number"] == null ? null : json["drawing_number"],
        costImpact: json["cost_impact"] == null ? null : json["cost_impact"],
        description: json["description"] == null ? null : json["description"],
        manager: json["manager"] == null
            ? null
            : CreatedBy.fromJson(json["manager"]),
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(json["created_by"]),
        location: json["location"] == null ? null : json["location"],
        reviewer: json["reviewer"] == null
            ? null
            : reviewerValues.map[json["reviewer"]],
        rev: json["rev"] == null ? null : json["rev"],
        documentNumber:
            json["document_number"] == null ? null : json["document_number"],
        reviewStatus:
            json["review_status"] == null ? null : json["review_status"],
        reviewDueDate: json["review_due_date"] == null
            ? null
            : DateTime.parse(json["review_due_date"]),
        reviewDate: json["review_date"] == null
            ? null
            : DateTime.parse(json["review_date"]),
        submitType: json["submit_type"],
        ballInCourt: json["ball_in_court"] == null
            ? null
            : List<Reviewer>.from(
                json["ball_in_court"].map((x) => reviewerValues.map[x])),
        assignments: json["assignments"] == null
            ? null
            : List<List<Assignment>>.from(json["assignments"].map((x) =>
                List<Assignment>.from(x.map((x) => Assignment.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "manager_date":
            managerDate == null ? null : managerDate.toIso8601String(),
        "title": title == null ? null : title,
        "status": status == null ? null : status,
        "state": state == null ? null : state,
        "process": process == null ? null : process,
        "document_code": documentCode == null ? null : documentCode,
        "due_date": dueDate == null ? null : dueDate.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "spec_section": specSection,
        "drawing_number": drawingNumber == null ? null : drawingNumber,
        "cost_impact": costImpact == null ? null : costImpact,
        "description": description == null ? null : description,
        "manager": manager == null ? null : manager.toJson(),
        "created_by": createdBy == null ? null : createdBy.toJson(),
        "location": location == null ? null : location,
        "reviewer": reviewer == null ? null : reviewerValues.reverse[reviewer],
        "rev": rev == null ? null : rev,
        "document_number": documentNumber == null ? null : documentNumber,
        "review_status": reviewStatus == null ? null : reviewStatus,
        "review_due_date":
            reviewDueDate == null ? null : reviewDueDate.toIso8601String(),
        "review_date": reviewDate == null ? null : reviewDate.toIso8601String(),
        "submit_type": submitType,
        "ball_in_court": ballInCourt == null
            ? null
            : List<dynamic>.from(
                ballInCourt.map((x) => reviewerValues.reverse[x])),
        "assignments": assignments == null
            ? null
            : List<dynamic>.from(assignments
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Assignment {
  Assignment({
    this.id,
    this.order,
    this.userId,
    this.dueDate,
    this.readedAt,
    this.status,
    this.state,
    this.documentStatus,
    this.username,
    this.fullName,
    this.response,
    this.sendDate,
    this.returnedDate,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.isOfficial,
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
  DateTime returnedDate;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  bool isOfficial;

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"] == null ? null : json["id"],
        order: json["order"] == null ? null : json["order"],
        userId: json["user_id"] == null ? null : json["user_id"],
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        readedAt: json["readed_at"],
        status: json["status"] == null ? null : json["status"],
        state: json["state"] == null ? null : json["state"],
        documentStatus: json["document_status"],
        username: json["username"] == null ? null : json["username"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        response: json["response"] == null ? null : json["response"],
        sendDate: json["send_date"] == null
            ? null
            : DateTime.parse(json["send_date"]),
        returnedDate: json["returned_date"] == null
            ? null
            : DateTime.parse(json["returned_date"]),
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isOfficial: json["is_official"] == null ? null : json["is_official"],
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
        "returned_date":
            returnedDate == null ? null : returnedDate.toIso8601String(),
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "is_official": isOfficial == null ? null : isOfficial,
      };
}

enum Reviewer {
  SUPERADMIN_SWIFT_DYNAMICS,
  NATEE_SWD,
  SAPJARERN_UDOMVIRIYALANON
}

final reviewerValues = EnumValues({
  "Natee SWD": Reviewer.NATEE_SWD,
  "Sapjarern Udomviriyalanon": Reviewer.SAPJARERN_UDOMVIRIYALANON,
  "Superadmin swift-dynamics": Reviewer.SUPERADMIN_SWIFT_DYNAMICS
});

class CreatedBy {
  CreatedBy({
    this.id,
    this.email,
    this.username,
    this.company,
    this.firstName,
    this.position,
    this.lastName,
    this.fullName,
    this.isAcceptTerms,
    this.permissionCorporate,
  });

  int id;
  Email email;
  Username username;
  String company;
  FirstName firstName;
  Position position;
  LastName lastName;
  Reviewer fullName;
  bool isAcceptTerms;
  int permissionCorporate;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : emailValues.map[json["email"]],
        username: json["username"] == null
            ? null
            : usernameValues.map[json["username"]],
        company: json["company"] == null ? null : json["company"],
        firstName: json["first_name"] == null
            ? null
            : firstNameValues.map[json["first_name"]],
        position: json["position"] == null
            ? null
            : positionValues.map[json["position"]],
        lastName: json["last_name"] == null
            ? null
            : lastNameValues.map[json["last_name"]],
        fullName: json["full_name"] == null
            ? null
            : reviewerValues.map[json["full_name"]],
        isAcceptTerms:
            json["is_accept_terms"] == null ? null : json["is_accept_terms"],
        permissionCorporate: json["permission_corporate"] == null
            ? null
            : json["permission_corporate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : emailValues.reverse[email],
        "username": username == null ? null : usernameValues.reverse[username],
        "company": company == null ? null : company,
        "first_name":
            firstName == null ? null : firstNameValues.reverse[firstName],
        "position": position == null ? null : positionValues.reverse[position],
        "last_name": lastName == null ? null : lastNameValues.reverse[lastName],
        "full_name": fullName == null ? null : reviewerValues.reverse[fullName],
        "is_accept_terms": isAcceptTerms == null ? null : isAcceptTerms,
        "permission_corporate":
            permissionCorporate == null ? null : permissionCorporate,
      };
}

enum Email {
  SUPERADMIN_SWIFTDYNAMICS_CO_TH,
  NATEE_SWIFTDYNAMICS_CO_TH,
  SAPJARERN081_GMAIL_COM
}

final emailValues = EnumValues({
  "natee@swiftdynamics.co.th": Email.NATEE_SWIFTDYNAMICS_CO_TH,
  "sapjarern081@gmail.com": Email.SAPJARERN081_GMAIL_COM,
  "superadmin@swiftdynamics.co.th": Email.SUPERADMIN_SWIFTDYNAMICS_CO_TH
});

enum FirstName { SUPERADMIN, NATEE, SAPJARERN }

final firstNameValues = EnumValues({
  "Natee": FirstName.NATEE,
  "Sapjarern": FirstName.SAPJARERN,
  "Superadmin": FirstName.SUPERADMIN
});

enum LastName { SWIFT_DYNAMICS, SWD, UDOMVIRIYALANON }

final lastNameValues = EnumValues({
  "SWD": LastName.SWD,
  "swift-dynamics": LastName.SWIFT_DYNAMICS,
  "Udomviriyalanon": LastName.UDOMVIRIYALANON
});

enum Position { PROJECT_MANAGER, ENGINEER, IT }

final positionValues = EnumValues({
  "Engineer": Position.ENGINEER,
  "IT": Position.IT,
  "Project Manager": Position.PROJECT_MANAGER
});

enum Username { SUPERADMIN, NATEE_SWIFTDYNAMICS_CO_TH, SAPJARERN081_GMAIL_COM }

final usernameValues = EnumValues({
  "natee@swiftdynamics.co.th": Username.NATEE_SWIFTDYNAMICS_CO_TH,
  "sapjarern081@gmail.com": Username.SAPJARERN081_GMAIL_COM,
  "superadmin": Username.SUPERADMIN
});

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
