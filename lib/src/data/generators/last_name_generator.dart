import 'package:test_data_generator/src/data/generators/random_generator.dart';
import 'package:test_data_generator/src/utils/random_utils.dart';

class LastNameGenerator implements RandomGenerator<String> {

  List<String> lastNames;

  LastNameGenerator(this.lastNames);

  @override
  String generate() {
    return lastNames[randomInRange(0, lastNames.length)];
  }
}