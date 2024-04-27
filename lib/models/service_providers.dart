// To parse this JSON data, do
//
//     final serviceProvidersModel = serviceProvidersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiceProvidersModel serviceProvidersModelFromJson(String str) => ServiceProvidersModel.fromJson(json.decode(str));

String serviceProvidersModelToJson(ServiceProvidersModel data) => json.encode(data.toJson());

class ServiceProvidersModel {
    final List<ServiceProvidersDataModel> data;
    final bool success;

    ServiceProvidersModel({
        required this.data,
        required this.success,
    });

    factory ServiceProvidersModel.fromJson(Map<String, dynamic> json) => ServiceProvidersModel(
        data: List<ServiceProvidersDataModel>.from(json["data"].map((x) => ServiceProvidersDataModel.fromJson(x))),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
    };
}

class ServiceProvidersDataModel {
    final ServiceProvider serviceProvider;
    final Plan plan;

    ServiceProvidersDataModel({
        required this.serviceProvider,
        required this.plan,
    });

    factory ServiceProvidersDataModel.fromJson(Map<String, dynamic> json) => ServiceProvidersDataModel(
        serviceProvider: ServiceProvider.fromJson(json["serviceProvider"]),
        plan: Plan.fromJson(json["plan"]),
    );

    Map<String, dynamic> toJson() => {
        "serviceProvider": serviceProvider.toJson(),
        "plan": plan.toJson(),
    };
}

class Plan {
    final double price;

    Plan({
        required this.price,
    });

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "price": price,
    };
}

class ServiceProvider {
    final String id;
    final String name;
    final String photoUrl;

    ServiceProvider({
        required this.id,
        required this.name,
        required this.photoUrl,
    });

    factory ServiceProvider.fromJson(Map<String, dynamic> json) => ServiceProvider(
        id: json["id"],
        name: json["name"],
        photoUrl: json["photoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photoUrl": photoUrl,
    };
}
