import 'dart:math';

int randomInRange(int min, int max) {
  Random rnd = Random();
  return min + rnd.nextInt(max - min);
}

