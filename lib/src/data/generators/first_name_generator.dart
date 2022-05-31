import 'package:test_data_generator/src/data/entities/static_data.dart';
import 'package:test_data_generator/src/data/generators/random_generator.dart';
import 'package:test_data_generator/src/utils/random_utils.dart';

class FirstNameGenerator implements RandomGenerator<String> {

  Gender gender;
  List<String> maleNames;
  List<String> femaleNames;

  FirstNameGenerator(this.gender, this.maleNames, this.femaleNames);

  @override
  String generate() {
    switch(gender) {
      case Gender.male:
        return maleNames[randomInRange(0, maleNames.length)];
      case Gender.female:
        return femaleNames[randomInRange(0, femaleNames.length)];
    }
  }
}