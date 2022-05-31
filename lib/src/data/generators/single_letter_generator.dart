import 'package:test_data_generator/src/data/generators/random_generator.dart';
import 'package:test_data_generator/src/utils/random_utils.dart';

class SingleLetterGenerator implements RandomGenerator<String> {

  static const String alphabet = "ABCDEFGHIJKLMNOPQRSTUVXYZ";

  @override
  String generate() {
    int index = randomInRange(0, 25);
    return alphabet[index];
  }
}