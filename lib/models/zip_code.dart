// To parse this JSON data, do
//
//     final zipCodeModel = zipCodeModelFromJson(jsonString);

import 'dart:convert';

ZipCodeModel zipCodeModelFromJson(String str) => ZipCodeModel.fromJson(json.decode(str));

String zipCodeModelToJson(ZipCodeModel data) => json.encode(data.toJson());

class ZipCodeModel {
    City city;
    State state;
    double altitude;
    double latitude;
    double longitude;
    String neighborhood;
    String complement;
    String code;
    String street;

    ZipCodeModel({
        required this.city,
        required this.state,
        required this.altitude,
        required this.latitude,
        required this.longitude,
        required this.neighborhood,
        required this.complement,
        required this.code,
        required this.street,
    });

    factory ZipCodeModel.fromJson(Map<String, dynamic> json) => ZipCodeModel(
        city: City.fromJson(json["city"]),
        state: State.fromJson(json["state"]),
        altitude: json["altitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        neighborhood: json["neighborhood"],
        complement: json["complement"],
        code: json["code"],
        street: json["street"],
    );

    Map<String, dynamic> toJson() => {
        "city": city.toJson(),
        "state": state.toJson(),
        "altitude": altitude,
        "latitude": latitude,
        "longitude": longitude,
        "neighborhood": neighborhood,
        "complement": complement,
        "code": code,
        "street": street,
    };
}

class City {
    String ibge;
    String name;
    int ddd;

    City({
        required this.ibge,
        required this.name,
        required this.ddd,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        ibge: json["ibge"],
        name: json["name"],
        ddd: json["ddd"],
    );

    Map<String, dynamic> toJson() => {
        "ibge": ibge,
        "name": name,
        "ddd": ddd,
    };
}

class State {
    String sigla;

    State({
        required this.sigla,
    });

    factory State.fromJson(Map<String, dynamic> json) => State(
        sigla: json["sigla"],
    );

    Map<String, dynamic> toJson() => {
        "sigla": sigla,
    };
}
