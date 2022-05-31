import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_data_generator/src/data/entities/static_data.dart';

part 'entities.freezed.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String middleInitial,
    required String lastName,
    required Gender gender,
    required int age,
    required DateTime birthdate,
    required String email,
    required String phone,
    required String addressLine1,
    required String city,
    required String state,
    required int postalCode,
  }) = _Person;
}

@freezed
class UsCity with _$UsCity {
  const factory UsCity({
    required int zipCode,
    required String city,
    required String state,
    required String county,
  }) = _UsCity;
}

@freezed
class UsAddress with _$UsAddress {
  const factory UsAddress({
    required String addressLine1,
    required String city,
    required String state,
    required int zipCode
  }) = _UsAddress;
}