// To parse this JSON data, do
//
//     final userSitearound = userSitearoundFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserSitearound userSitearoundFromJson(String str) => UserSitearound.fromJson(json.decode(str));

String userSitearoundToJson(UserSitearound data) => json.encode(data.toJson());

class UserSitearound {
    UserSitearound({
        @required this.count,
        @required this.page,
        @required this.result,
    });

    dynamic count;
    dynamic page;
    List<Result> result;

    factory UserSitearound.fromJson(Map<String, dynamic> json) => UserSitearound(
        count: json["count"],
        page: json["page"],
        result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "page": page,
        "result": result == null ? null : List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        @required this.id,
        @required this.position,
        @required this.name,
        @required this.email,
        @required this.username,
        @required this.lastName,
        @required this.firstName,
        @required this.lastLogin,
        @required this.isActive,
        @required this.isVerified,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.phone,
        @required this.company,
        @required this.createdBy,
    });

    int id;
    String position;
    String name;
    String email;
    String username;
    String lastName;
    String firstName;
    DateTime lastLogin;
    bool isActive;
    bool isVerified;
    DateTime createdAt;
    DateTime updatedAt;
    String phone;
    Company company;
    CreatedBy createdBy;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        position: json["position"] == null ? null : json["position"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        isActive: json["is_active"] == null ? null : json["is_active"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        phone: json["phone"] == null ? null : json["phone"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "position": position == null ? null : position,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "last_name": lastName == null ? null : lastName,
        "first_name": firstName == null ? null : firstName,
        "last_login": lastLogin == null ? null : lastLogin.toIso8601String(),
        "is_active": isActive == null ? null : isActive,
        "is_verified": isVerified == null ? null : isVerified,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "phone": phone == null ? null : phone,
        "company": company == null ? null : company.toJson(),
        "created_by": createdBy == null ? null : createdBy.toJson(),
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
    Organization organization;
    String code;
    Place place;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        organization: json["organization"] == null ? null : organizationValues.map[json["organization"]],
        code: json["code"] == null ? null : json["code"],
        place: json["place"] == null ? null : Place.fromJson(json["place"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "organization": organization == null ? null : organizationValues.reverse[organization],
        "code": code == null ? null : code,
        "place": place == null ? null : place.toJson(),
    };
}

enum Organization { SWIFT_DYNAMICS, MCFLY }

final organizationValues = EnumValues({
    "Mcfly": Organization.MCFLY,
    "swift-dynamics": Organization.SWIFT_DYNAMICS
});

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
    Email email;
    Username username;
    String company;
    FirstName firstName;
    Position position;
    Organization lastName;
    FullName fullName;
    bool isAcceptTerms;
    int permissionCorporate;

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : emailValues.map[json["email"]],
        username: json["username"] == null ? null : usernameValues.map[json["username"]],
        company: json["company"] == null ? null : json["company"],
        firstName: json["first_name"] == null ? null : firstNameValues.map[json["first_name"]],
        position: json["position"] == null ? null : positionValues.map[json["position"]],
        lastName: json["last_name"] == null ? null : organizationValues.map[json["last_name"]],
        fullName: json["full_name"] == null ? null : fullNameValues.map[json["full_name"]],
        isAcceptTerms: json["is_accept_terms"] == null ? null : json["is_accept_terms"],
        permissionCorporate: json["permission_corporate"] == null ? null : json["permission_corporate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : emailValues.reverse[email],
        "username": username == null ? null : usernameValues.reverse[username],
        "company": company == null ? null : company,
        "first_name": firstName == null ? null : firstNameValues.reverse[firstName],
        "position": position == null ? null : positionValues.reverse[position],
        "last_name": lastName == null ? null : organizationValues.reverse[lastName],
        "full_name": fullName == null ? null : fullNameValues.reverse[fullName],
        "is_accept_terms": isAcceptTerms == null ? null : isAcceptTerms,
        "permission_corporate": permissionCorporate == null ? null : permissionCorporate,
    };
}

enum Email { VARITISBOSS_GMAIL_COM, SUPERADMIN_SWIFTDYNAMICS_CO_TH }

final emailValues = EnumValues({
    "superadmin@swiftdynamics.co.th": Email.SUPERADMIN_SWIFTDYNAMICS_CO_TH,
    "varitisboss@gmail.com": Email.VARITISBOSS_GMAIL_COM
});

enum FirstName { MARTY, SUPERADMIN }

final firstNameValues = EnumValues({
    "Marty": FirstName.MARTY,
    "Superadmin": FirstName.SUPERADMIN
});

enum FullName { MARTY_MCFLY, SUPERADMIN_SWIFT_DYNAMICS }

final fullNameValues = EnumValues({
    "Marty Mcfly": FullName.MARTY_MCFLY,
    "Superadmin swift-dynamics": FullName.SUPERADMIN_SWIFT_DYNAMICS
});

enum Position { PRODUCT_MANAGER, PROJECT_MANAGER }

final positionValues = EnumValues({
    "Product Manager": Position.PRODUCT_MANAGER,
    "Project Manager": Position.PROJECT_MANAGER
});

enum Username { VARITISBOSS_GMAIL_COM, SUPERADMIN }

final usernameValues = EnumValues({
    "superadmin": Username.SUPERADMIN,
    "varitisboss@gmail.com": Username.VARITISBOSS_GMAIL_COM
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
