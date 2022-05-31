import 'package:test_data_generator/src/data/entities/static_data.dart';
import 'package:test_data_generator/src/data/generators/random_generator.dart';
import 'package:test_data_generator/src/utils/random_utils.dart';

class GenderGenerator implements RandomGenerator<Gender> {
  @override
  Gender generate() {
    return Gender.values[randomInRange(0, 2)];
  }
}
