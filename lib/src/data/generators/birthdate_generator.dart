import 'package:test_data_generator/src/data/generators/random_generator.dart';
import 'package:test_data_generator/src/utils/random_utils.dart';

class BirthdateGenerator implements RandomGenerator<DateTime> {

  @override
  DateTime generate() {
    int year = randomInRange(1900, DateTime.now().year);
    int month = randomInRange(1, 12);
    int day = randomInRange(1, daysInMonth(month, year) ?? 20);

    return DateTime(year, month, day);
  }

  int? daysInMonth(final int monthNum, final int year) {
    if (monthNum > 12) {
      return null;
    }
    List<int> monthLength = List.filled(12, 0);
    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }

    return monthLength[monthNum - 1];
  }

  bool leapYear(int year) {
    bool leapYear = false;
    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) { leapYear = true ;}

    return leapYear;
  }
}