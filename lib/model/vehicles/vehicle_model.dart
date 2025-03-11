import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/model/vehicles/make_model.dart';

List<VehicleModel> vehicleModelFromJson(String str) {
  final jsonData = json.decode(str);
  return List<VehicleModel>.from(
      jsonData["vehicles"].map((x) => VehicleModel.fromJson(x)));
}

VehicleModel oneVehicleModelFromJson(String str) {
  final Map<String, dynamic> jsonData = json.decode(str);
  log("✅ Parsed JSON: $jsonData");

  if (jsonData.containsKey('vehicle')) {
    return VehicleModel.fromJson(jsonData['vehicle']);
  } else {
    throw Exception("Invalid JSON structure: Missing 'vehicle' key");
  }
}

class VehicleModel {
  String? id;
  MakeModel? make;
  String? modelName;
  String? color;
  int? makeYear; // Changed from String to int
  String? registrationNumber; // Matches "licencePlate" field in API
  String? photo;
  int? noOfSeats;
  int? backRowSeating;
  String? luggage;
  String? userId;
  bool? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;

  VehicleModel(
      {this.id,
      this.make,
      this.modelName,
      this.color,
      this.makeYear,
      this.registrationNumber,
      this.photo,
      this.noOfSeats,
      this.backRowSeating,
      this.luggage,
      this.userId,
      this.isDefault,
      this.createdAt,
      this.updatedAt});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      make: json['make'] != null ? MakeModel.fromJson(json['make']) : null,
      modelName: json['model'],
      color: json['color'],
      makeYear: json['year'], // Ensure it's an integer
      registrationNumber: json['licencePlate'], // Matching field name
      photo: json['photo'],
      noOfSeats: json['noOfSeats'],
      backRowSeating: json['backRowSeating'],
      luggage: json['luggage'],
      userId: json['userId'],
      isDefault: json['isDefault'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'make': make?.toJson(),
      'model': modelName ?? "",
      'color': color ?? "",
      'year': makeYear ?? 2024,
      'licencePlate': registrationNumber ?? "",
      'photo': photo ?? "",
      'noOfSeats': noOfSeats ?? 1,
      'backRowSeating': backRowSeating ?? 2,
      'luggage': luggage ?? "No luggage",
      'userId': userId,
      'isDefault': isDefault ?? false,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    }..removeWhere((key, value) => value == null); // Remove null values
  }

  VehicleModel copyWith(
      {ValueGetter<String?>? id,
      ValueGetter<MakeModel?>? make,
      ValueGetter<String?>? modelName,
      ValueGetter<String?>? color,
      ValueGetter<int?>? makeYear,
      ValueGetter<String?>? registrationNumber,
      ValueGetter<String?>? photo,
      ValueGetter<int?>? noOfSeats,
      ValueGetter<int?>? backRowSeating,
      ValueGetter<String?>? luggage,
      ValueGetter<String?>? userId,
      ValueGetter<bool?>? isDefault,
      ValueGetter<DateTime?>? createdAt,
      ValueGetter<DateTime?>? updatedAt}) {
    return VehicleModel(
        id: id != null ? id() : this.id,
        make: make != null ? make() : this.make,
        modelName: modelName != null ? modelName() : this.modelName,
        color: color != null ? color() : this.color,
        makeYear: makeYear != null ? makeYear() : this.makeYear,
        registrationNumber: registrationNumber != null
            ? registrationNumber()
            : this.registrationNumber,
        photo: photo != null ? photo() : this.photo,
        noOfSeats: noOfSeats != null ? noOfSeats() : this.noOfSeats,
        backRowSeating:
            backRowSeating != null ? backRowSeating() : this.backRowSeating,
        luggage: luggage != null ? luggage() : this.luggage,
        userId: userId != null ? userId() : this.userId,
        isDefault: isDefault != null ? isDefault() : this.isDefault,
        createdAt: createdAt != null ? createdAt() : this.createdAt,
        updatedAt: updatedAt != null ? updatedAt() : this.updatedAt);
  }
}
