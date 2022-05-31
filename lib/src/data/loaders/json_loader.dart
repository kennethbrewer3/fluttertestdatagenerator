import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_data_generator/src/data/entities/entities.dart';

Future<String> _loadFromAsset(String jsonAsset) async {
  return await rootBundle.loadString(jsonAsset);
}

Future<List<String>> loadStringListFromJson(String jsonAsset) async {
  final String data = await _loadFromAsset(jsonAsset);
  final jsonResponse = await json.decode(data);
  return List.from(jsonResponse);
}

Future<List<UsCity>> loadUsCitiesListFromJson(String jsonAsset) async {
  final String data = await _loadFromAsset(jsonAsset);
  final jsonResponse = await json.decode(data) as List;
  return jsonResponse
      .map((cityJson) => _usCityFromJson(cityJson))
      .toList(growable: false);
}

UsCity _usCityFromJson(dynamic json) {
  return UsCity(
      zipCode: json["zip_code"] as int,
      city: json["city"] as String,
      state: json["state"] as String,
      county: json["county"] as String,
  );
}
