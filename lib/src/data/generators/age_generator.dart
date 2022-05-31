import 'package:test_data_generator/src/data/generators/random_generator.dart';

class AgeGenerator implements RandomGenerator<int> {

  DateTime birthdate;

  AgeGenerator(this.birthdate);

  @override
  int generate() {
    return DateTime.now().year - birthdate.year;
  }
}