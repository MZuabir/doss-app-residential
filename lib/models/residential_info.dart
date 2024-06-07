// To parse this JSON data, do
//
//     final residentialInfoModel = residentialInfoModelFromJson(jsonString);

import 'dart:convert';

ResidentialInfoModel residentialInfoModelFromJson(String str) => ResidentialInfoModel.fromJson(json.decode(str));

String residentialInfoModelToJson(ResidentialInfoModel data) => json.encode(data.toJson());

class ResidentialInfoModel {
    String? name;
    String? userStatus;
    String? photoUrl;
    ServiceProvider? serviceProvider;
    List<HomePlace>? homePlaces;

    ResidentialInfoModel({
        this.name,
        this.userStatus,
        this.photoUrl,
        this.serviceProvider,
        this.homePlaces,
    });

    factory ResidentialInfoModel.fromJson(Map<String, dynamic> json) => ResidentialInfoModel(
        name: json["name"],
        userStatus: json["userStatus"],
        photoUrl: json["photoUrl"],
        serviceProvider: json["serviceProvider"] == null ? null : ServiceProvider.fromJson(json["serviceProvider"]),
        homePlaces: json["homePlaces"] == null ? [] : List<HomePlace>.from(json["homePlaces"]!.map((x) => HomePlace.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "userStatus": userStatus,
        "photoUrl": photoUrl,
        "serviceProvider": serviceProvider?.toJson(),
        "homePlaces": homePlaces == null ? [] : List<dynamic>.from(homePlaces!.map((x) => x.toJson())),
    };
}

class HomePlace {
    String? homePlaceId;
    String? homePlaceName;
    bool? selectDefaultHomePlace;
    bool? registeredVehicle;

    HomePlace({
        this.homePlaceId,
        this.homePlaceName,
        this.selectDefaultHomePlace,
        this.registeredVehicle,
    });

    factory HomePlace.fromJson(Map<String, dynamic> json) => HomePlace(
        homePlaceId: json["homePlaceId"],
        homePlaceName: json["homePlaceName"],
        selectDefaultHomePlace: json["selectDefaultHomePlace"],
        registeredVehicle: json["registeredVehicle"],
    );

    Map<String, dynamic> toJson() => {
        "homePlaceId": homePlaceId,
        "homePlaceName": homePlaceName,
        "selectDefaultHomePlace": selectDefaultHomePlace,
        "registeredVehicle": registeredVehicle,
    };
}

class ServiceProvider {
    String? name;
    String? planName;
    String? photoUrl;
    String? status;

    ServiceProvider({
        this.name,
        this.planName,
        this.photoUrl,
        this.status,
    });

    factory ServiceProvider.fromJson(Map<String, dynamic> json) => ServiceProvider(
        name: json["name"],
        planName: json["planName"],
        photoUrl: json["photoUrl"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "planName": planName,
        "photoUrl": photoUrl,
        "status": status,
    };
}
