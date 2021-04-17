// To parse this JSON data, do
//
//     final userDirectoryDetail = userDirectoryDetailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserDirectoryDetail userDirectoryDetailFromJson(String str) => UserDirectoryDetail.fromJson(json.decode(str));

String userDirectoryDetailToJson(UserDirectoryDetail data) => json.encode(data.toJson());

class UserDirectoryDetail {
    UserDirectoryDetail({
        @required this.projectUserId,
        @required this.position,
        @required this.company,
        @required this.organization,
        @required this.permissions,
        @required this.template,
        @required this.id,
        @required this.active,
        @required this.email,
        @required this.username,
        @required this.lastName,
        @required this.firstName,
        @required this.lastLogin,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.joinAt,
        @required this.fullName,
        @required this.createdBy,
        @required this.phone,
    });

    int projectUserId;
    String position;
    Company company;
    int organization;
    Permissions permissions;
    Template template;
    int id;
    bool active;
    String email;
    String username;
    String lastName;
    String firstName;
    DateTime lastLogin;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime joinAt;
    String fullName;
    String createdBy;
    String phone;

    factory UserDirectoryDetail.fromJson(Map<String, dynamic> json) => UserDirectoryDetail(
        projectUserId: json["project_user_id"] == null ? null : json["project_user_id"],
        position: json["position"] == null ? null : json["position"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        organization: json["organization"] == null ? null : json["organization"],
        permissions: json["permissions"] == null ? null : Permissions.fromJson(json["permissions"]),
        template: json["template"] == null ? null : Template.fromJson(json["template"]),
        id: json["id"] == null ? null : json["id"],
        active: json["active"] == null ? null : json["active"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        joinAt: json["join_at"] == null ? null : DateTime.parse(json["join_at"]),
        fullName: json["full_name"] == null ? null : json["full_name"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        phone: json["phone"] == null ? null : json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "project_user_id": projectUserId == null ? null : projectUserId,
        "position": position == null ? null : position,
        "company": company == null ? null : company.toJson(),
        "organization": organization == null ? null : organization,
        "permissions": permissions == null ? null : permissions.toJson(),
        "template": template == null ? null : template.toJson(),
        "id": id == null ? null : id,
        "active": active == null ? null : active,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "last_name": lastName == null ? null : lastName,
        "first_name": firstName == null ? null : firstName,
        "last_login": lastLogin == null ? null : lastLogin.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "join_at": joinAt == null ? null : joinAt.toIso8601String(),
        "full_name": fullName == null ? null : fullName,
        "created_by": createdBy == null ? null : createdBy,
        "phone": phone == null ? null : phone,
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

class Permissions {
    Permissions({
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

    factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
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

class Template {
    Template({
        @required this.name,
        @required this.activeUser,
        @required this.inactiveUser,
        @required this.id,
    });

    String name;
    int activeUser;
    int inactiveUser;
    int id;

    factory Template.fromJson(Map<String, dynamic> json) => Template(
        name: json["name"] == null ? null : json["name"],
        activeUser: json["active_user"] == null ? null : json["active_user"],
        inactiveUser: json["inactive_user"] == null ? null : json["inactive_user"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "active_user": activeUser == null ? null : activeUser,
        "inactive_user": inactiveUser == null ? null : inactiveUser,
        "id": id == null ? null : id,
    };
}
