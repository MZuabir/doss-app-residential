// To parse this JSON data, do
//
//     final serviceProvidersModel = serviceProvidersModelFromJson(jsonString);

import 'dart:convert';

List<ServiceProvidersModel> serviceProvidersModelFromJson(String str) => List<ServiceProvidersModel>.from(json.decode(str).map((x) => ServiceProvidersModel.fromJson(x)));

String serviceProvidersModelToJson(List<ServiceProvidersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceProvidersModel {
    ServiceProvider? serviceProvider;
    Plan? plan;

    ServiceProvidersModel({
        this.serviceProvider,
        this.plan,
    });

    factory ServiceProvidersModel.fromJson(Map<String, dynamic> json) => ServiceProvidersModel(
        serviceProvider: json["serviceProvider"] == null ? null : ServiceProvider.fromJson(json["serviceProvider"]),
        plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
    );

    Map<String, dynamic> toJson() => {
        "serviceProvider": serviceProvider?.toJson(),
        "plan": plan?.toJson(),
    };
}

class Plan {
    double? price;

    Plan({
        this.price,
    });

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "price": price,
    };
}

class ServiceProvider {
    String? id;
    String? name;
    String? photoUrl;
    String? workPlaceId;

    ServiceProvider({
        this.id,
        this.name,
        this.photoUrl,
        this.workPlaceId,
    });

    factory ServiceProvider.fromJson(Map<String, dynamic> json) => ServiceProvider(
        id: json["id"],
        name: json["name"],
        photoUrl: json["photoUrl"],
        workPlaceId: json["workPlaceId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photoUrl": photoUrl,
        "workPlaceId": workPlaceId,
    };
}
