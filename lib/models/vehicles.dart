// To parse this JSON data, do
//
//     final vehiclesModel = vehiclesModelFromJson(jsonString);

import 'dart:convert';

List<VehiclesModel> vehiclesModelFromJson(String str) => List<VehiclesModel>.from(json.decode(str).map((x) => VehiclesModel.fromJson(x)));

String vehiclesModelToJson(List<VehiclesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehiclesModel {
    String? id;
    String? brand;
    String? model;
    String? color;
    String? plate;
    String? photoUrl;
    bool? defaultVehicle;
    String? vehicleType;
    String? vehicleStatus;
    DateTime? created;

    VehiclesModel({
        this.id,
        this.brand,
        this.model,
        this.color,
        this.plate,
        this.photoUrl,
        this.defaultVehicle,
        this.vehicleType,
        this.vehicleStatus,
        this.created,
    });

    factory VehiclesModel.fromJson(Map<String, dynamic> json) => VehiclesModel(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
        color: json["color"],
        plate: json["plate"],
        photoUrl: json["photoUrl"],
        defaultVehicle: json["defaultVehicle"],
        vehicleType: json["vehicleType"],
        vehicleStatus: json["vehicleStatus"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "model": model,
        "color": color,
        "plate": plate,
        "photoUrl": photoUrl,
        "defaultVehicle": defaultVehicle,
        "vehicleType": vehicleType,
        "vehicleStatus": vehicleStatus,
        "created": created?.toIso8601String(),
    };
}
