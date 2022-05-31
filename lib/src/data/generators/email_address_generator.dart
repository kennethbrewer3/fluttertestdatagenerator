import 'package:test_data_generator/src/data/generators/random_generator.dart';
import 'package:test_data_generator/src/utils/random_utils.dart';

class EmailAddressGenerator implements RandomGenerator<String> {
  List<String> domains;
  String firstName;
  String lastName;

  EmailAddressGenerator(this.domains, this.firstName, this.lastName);

  @override
  String generate() {
    return firstName.toLowerCase() +
        "." +
        lastName.toLowerCase() +
        "@" +
        domains[randomInRange(0, domains.length)];
  }
}
