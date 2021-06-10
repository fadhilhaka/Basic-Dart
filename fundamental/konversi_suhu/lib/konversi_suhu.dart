library konversi_suhu;

import 'dart:io';

/// A Calculator.
// class Calculator {
/// Returns [value] plus 1.
// int addOne(int value) => value + 1;
// }

void main() {
  stdout.write('Masukkan suhu dalam Fahrenheit: ');
  var fahrenheit = num.parse(stdin.readLineSync());
  var celsius = (fahrenheit - 32) * 5 / 9;
  print('$fahrenheit derajat Fahrenheit = $celsius derajat celsius');
}
