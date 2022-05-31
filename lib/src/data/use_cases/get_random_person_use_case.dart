import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/entities/entities.dart';
import 'package:test_data_generator/src/data/entities/static_data.dart';
import 'package:test_data_generator/src/data/generators/address_generator.dart';
import 'package:test_data_generator/src/data/generators/age_generator.dart';
import 'package:test_data_generator/src/data/generators/birthdate_generator.dart';
import 'package:test_data_generator/src/data/generators/email_address_generator.dart';
import 'package:test_data_generator/src/data/generators/first_name_generator.dart';
import 'package:test_data_generator/src/data/generators/gender_generator.dart';
import 'package:test_data_generator/src/data/generators/last_name_generator.dart';
import 'package:test_data_generator/src/data/generators/single_letter_generator.dart';
import 'package:test_data_generator/src/data/generators/us_phone_number_generator.dart';
import 'package:test_data_generator/src/data/repositories/city_repository.dart';
import 'package:test_data_generator/src/data/repositories/common_street_designations_repository.dart';
import 'package:test_data_generator/src/data/repositories/common_street_names_repository.dart';
import 'package:test_data_generator/src/data/repositories/domain_name_repository.dart';
import 'package:test_data_generator/src/data/repositories/female_first_name_repository.dart';
import 'package:test_data_generator/src/data/repositories/last_name_repository.dart';
import 'package:test_data_generator/src/data/repositories/male_first_name_repository.dart';

class GetRandomPersonUseCase {
  List<String> maleFirstNames;
  List<String> femaleFirstNames;
  List<String> lastNames;
  List<String> domains;
  List<String> streetNames;
  List<String> streetDesignators;
  List<UsCity> usCities;

  GetRandomPersonUseCase(
    this.maleFirstNames,
    this.femaleFirstNames,
    this.lastNames,
    this.domains,
    this.streetNames,
    this.streetDesignators,
    this.usCities,
  );

  Future<Person> execute() async {
    Gender gender = GenderGenerator().generate();
    String firstName =
        FirstNameGenerator(gender, maleFirstNames, femaleFirstNames).generate();
    String middleInitial = SingleLetterGenerator().generate();
    String lastName = LastNameGenerator(lastNames).generate();
    DateTime birthdate = BirthdateGenerator().generate();
    int age = AgeGenerator(birthdate).generate();
    String email =
        EmailAddressGenerator(domains, firstName, lastName).generate();
    String phoneNumber = USPhoneNumberGenerator().generate();
    UsAddress address =
        AddressGenerator(streetNames, streetDesignators, usCities).generate();

    String addressLine1 = address.addressLine1;
    String city = address.city;
    String state = address.state;
    int postalCode = address.zipCode;

    return Person(
        firstName: firstName,
        middleInitial: middleInitial,
        lastName: lastName,
        gender: gender,
        age: age,
        birthdate: birthdate,
        email: email,
        phone: phoneNumber,
        addressLine1: addressLine1,
        city: city,
        state: state,
        postalCode: postalCode);
  }
}

class PersonProvider {
  GetRandomPersonUseCase? _useCase;

  List<String>? maleFirstNames;
  List<String>? femaleFirstNames;
  List<String>? lastNames;
  List<String>? domainNames;
  List<String>? streetNames;
  List<String>? streetDesignations;
  List<UsCity>? cities;

  PersonProvider({
    required this.maleFirstNames,
    required this.femaleFirstNames,
    required this.lastNames,
    required this.domainNames,
    required this.streetNames,
    required this.streetDesignations,
    required this.cities,
  });

  Future<bool> _init() async {
    _useCase = GetRandomPersonUseCase(
        maleFirstNames ??= List<String>.empty(),
        femaleFirstNames ??= List<String>.empty(),
        lastNames ??= List<String>.empty(),
        domainNames ??= List<String>.empty(),
        streetNames ??= List<String>.empty(),
        streetDesignations ??= List<String>.empty(),
        cities ??= List<UsCity>.empty(),
    );
    return _useCase != null;
  }

  Future<Person> fetchPerson() async {
    if (_useCase == null) await _init();
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(_useCase?.execute());
  }
}

final personProvider = Provider<PersonProvider>((ref) {
  final maleFirstNameList = ref.watch(maleFirstNameListFutureProvider).value;
  final femaleFirstNameList = ref.watch(femaleFirstNameListFutureProvider).value;
  final lastNameList = ref.watch(lastNameListFutureProvider).value;
  final domainNamesList = ref.watch(domainNameListFutureProvider).value;
  final streetNamesList = ref.watch(streetNameListFutureProvider).value;
  final streetDesignationList = ref.watch(streetDesignationListFutureProvider).value;
  final cityList = ref.watch(cityListFutureProvider).value;

  return PersonProvider(
    maleFirstNames: maleFirstNameList,
    femaleFirstNames: femaleFirstNameList,
    lastNames: lastNameList,
    domainNames: domainNamesList,
    streetNames: streetNamesList,
    streetDesignations: streetDesignationList,
    cities: cityList,
  );
});

final personFutureProvider = FutureProvider<Person>((ref)  {
  final personRepository = ref.watch(personProvider);
  return personRepository.fetchPerson();
});
