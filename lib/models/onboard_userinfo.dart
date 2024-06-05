// To parse this JSON data, do
//
//     final onboardUserInfoModel = onboardUserInfoModelFromJson(jsonString);

import 'dart:convert';

OnboardUserInfoModel onboardUserInfoModelFromJson(String str) => OnboardUserInfoModel.fromJson(json.decode(str));

String onboardUserInfoModelToJson(OnboardUserInfoModel data) => json.encode(data.toJson());

class OnboardUserInfoModel {
    Residential? residential;
    TermsAccept? termsAccept;
    Addresses? addresses;
    List<dynamic>? vehicles;

    OnboardUserInfoModel({
        this.residential,
        this.termsAccept,
        this.addresses,
        this.vehicles,
    });

    factory OnboardUserInfoModel.fromJson(Map<String, dynamic> json) => OnboardUserInfoModel(
        residential: json["residential"] == null ? null : Residential.fromJson(json["residential"]),
        termsAccept: json["termsAccept"] == null ? null : TermsAccept.fromJson(json["termsAccept"]),
        addresses: json["addresses"] == null ? null : Addresses.fromJson(json["addresses"]),
        vehicles: json["vehicles"] == null ? [] : List<dynamic>.from(json["vehicles"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "residential": residential?.toJson(),
        "termsAccept": termsAccept?.toJson(),
        "addresses": addresses?.toJson(),
        "vehicles": vehicles == null ? [] : List<dynamic>.from(vehicles!.map((x) => x)),
    };
}

class Addresses {
    String? homePlaceId;
    String? homePlaceName;
    bool? selectDefaultHomePlace;
    String? country;
    String? state;
    String? city;
    String? street;
    String? neighborhood;
    String? complement;
    String? zipCode;
    String? number;

    Addresses({
        this.homePlaceId,
        this.homePlaceName,
        this.selectDefaultHomePlace,
        this.country,
        this.state,
        this.city,
        this.street,
        this.neighborhood,
        this.complement,
        this.zipCode,
        this.number,
    });

    factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        homePlaceId: json["homePlaceId"],
        homePlaceName: json["homePlaceName"],
        selectDefaultHomePlace: json["selectDefaultHomePlace"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        street: json["street"],
        neighborhood: json["neighborhood"],
        complement: json["complement"],
        zipCode: json["zipCode"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "homePlaceId": homePlaceId,
        "homePlaceName": homePlaceName,
        "selectDefaultHomePlace": selectDefaultHomePlace,
        "country": country,
        "state": state,
        "city": city,
        "street": street,
        "neighborhood": neighborhood,
        "complement": complement,
        "zipCode": zipCode,
        "number": number,
    };
}

class Residential {
    String? name;
    String? typeDocument;
    String? document;
    String? phone;
    String? photo;
    String? step;

    Residential({
        this.name,
        this.typeDocument,
        this.document,
        this.phone,
        this.photo,
        this.step,
    });

    factory Residential.fromJson(Map<String, dynamic> json) => Residential(
        name: json["name"],
        typeDocument: json["typeDocument"],
        document: json["document"],
        phone: json["phone"],
        photo: json["photo"],
        step: json["step"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "typeDocument": typeDocument,
        "document": document,
        "phone": phone,
        "photo": photo,
        "step": step,
    };
}

class TermsAccept {
    bool? termsAccept;
    bool? iAmOver12YearsOld;

    TermsAccept({
        this.termsAccept,
        this.iAmOver12YearsOld,
    });

    factory TermsAccept.fromJson(Map<String, dynamic> json) => TermsAccept(
        termsAccept: json["termsAccept"],
        iAmOver12YearsOld: json["iAmOver12YearsOld"],
    );

    Map<String, dynamic> toJson() => {
        "termsAccept": termsAccept,
        "iAmOver12YearsOld": iAmOver12YearsOld,
    };
}
