// To parse this JSON data, do
//
//     final plansModel = plansModelFromJson(jsonString);

import 'dart:convert';

List<PlansModel> plansModelFromJson(String str) => List<PlansModel>.from(json.decode(str).map((x) => PlansModel.fromJson(x)));

String plansModelToJson(List<PlansModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlansModel {
    String? id;
    String? description;
    double? price;

    PlansModel({
        this.id,
        this.description,
        this.price,
    });

    factory PlansModel.fromJson(Map<String, dynamic> json) => PlansModel(
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
