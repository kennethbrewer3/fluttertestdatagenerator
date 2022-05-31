import 'package:test_data_generator/src/data/generators/random_generator.dart';
import 'package:test_data_generator/src/utils/random_utils.dart';

class USPhoneNumberGenerator implements RandomGenerator<String> {
  @override
  String generate() {
    var areaCode = randomInRange(111, 1000);
    var firstFour = randomInRange(111, 1000);
    var lastFour = randomInRange(1111, 10000);
    return "+1$areaCode$firstFour$lastFour";
  }
}