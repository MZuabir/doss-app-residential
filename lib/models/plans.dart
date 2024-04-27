// To parse this JSON data, do
//
//     final plansModel = plansModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlansModel plansModelFromJson(String str) => PlansModel.fromJson(json.decode(str));

String plansModelToJson(PlansModel data) => json.encode(data.toJson());

class PlansModel {
    final PlansDataModel data;
    final bool success;

    PlansModel({
        required this.data,
        required this.success,
    });

    factory PlansModel.fromJson(Map<String, dynamic> json) => PlansModel(
        data: PlansDataModel.fromJson(json["data"]),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
    };
}

class PlansDataModel {
    final List<Plan> plans;

    PlansDataModel({
        required this.plans,
    });

    factory PlansDataModel.fromJson(Map<String, dynamic> json) => PlansDataModel(
        plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
    };
}

class Plan {
    final String id;
    final String description;
    final double price;

    Plan({
        required this.id,
        required this.description,
        required this.price,
    });

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        description: json["description"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "price": price,
    };
}
