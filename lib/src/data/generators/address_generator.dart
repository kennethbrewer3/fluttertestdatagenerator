import 'package:test_data_generator/src/data/entities/entities.dart';
import 'package:test_data_generator/src/data/generators/random_generator.dart';
import 'package:test_data_generator/src/utils/random_utils.dart';

class AddressGenerator implements RandomGenerator<UsAddress> {
  List<String> streetNames;
  List<String> streetDesignations;
  List<UsCity> usCities;

  AddressGenerator(this.streetNames, this.streetDesignations, this.usCities);

  @override
  UsAddress generate() {
    UsCity city = usCities[randomInRange(1, usCities.length)];
    return UsAddress(
        addressLine1: _generateLineOne(),
        city: city.city,
        state: city.state,
        zipCode: city.zipCode);
  }

  String _generateLineOne() {
    return randomInRange(1, 9999).toString() +
        " " +
        streetNames[randomInRange(0, streetNames.length)] +
        " " +
        streetDesignations[randomInRange(0, streetDesignations.length)];
  }
}
