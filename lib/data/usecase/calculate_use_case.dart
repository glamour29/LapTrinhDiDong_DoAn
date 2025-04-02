import 'dart:math' as math;
import 'package:expressions/expressions.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class CalculateUseCase {
  String call(Map<String, dynamic> map) => _calculate(map);
}

String _calculate(Map<String, dynamic> map) {
  String string = map['input'];
  if (double.tryParse(string) != null) {
    return string;
  }
  if (string.endsWith(' + ') ||
      string.endsWith(' - ') ||
      string.endsWith(' × ') ||
      string.endsWith(' ÷ ')) {
    string = string.substring(0, string.length - 3);
  }
  if (map['isRadian']) {
    string = string.replaceAll('π', '180');
  }
  bool isDotDecimalLocale = map['isDotDecimalLocale'];
  if (isDotDecimalLocale) {
    string = string.replaceAll(',', '');
  } else {
    string = string.replaceAll('.', '');
    string = string.replaceAll(',', '.');
  }
  string = string.replaceAll(RegExp(r'(?<=\d)\.(?=\s|$)'), '');
  string = string.replaceAllMapped(
    RegExp(r'(?<!\d)\.'),
        (match) => '0.',
  );
  string = string.replaceAll('x', '*');
  string = string.replaceAll('×', '*');
  string = string.replaceAll('%', '*0.01');
  string = string.replaceAll('÷', '/');
  string = string.replaceAll(':', '/');
  string = string.replaceAll('E+', '*10^');
  string = string.replaceAll('E-', '/10^');

  string = string.replaceAllMapped(
      RegExp(r'((?:sin|cos|tan|cot|log|√)\([^()]*\))\^\(([^)]+)\)'),
          (match) => "pow(${match.group(1)}, ${match.group(2)})");
  string = _replacePower(string);
  string = string.replaceAllMapped(RegExp(r'(\d+|e|π|)\^\(([^)]+)\)'),
          (match) => 'pow(${match.group(1)},${match.group(2)})');

  string = string.replaceAllMapped(RegExp(r'\(([^)]+)\)\^\(([^)]+)\)'),
          (match) => 'pow(${match.group(1)},${match.group(2)})');
  string = string.replaceAllMapped(RegExp(r'(\d*)π'),
          (match) => '${match.group(1)}'.isEmpty ? 'pi' : '${match.group(1)}*pi');
  string = string.replaceAllMapped(
      RegExp(r'(\d+)!'), (match) => 'factorial(${match.group(1)})');
  string = string.replaceAllMapped(RegExp(r'(\d+)e'),
          (match) => '${match.group(1)}'.isEmpty ? 'e' : '${match.group(1)}*e');
  string = string.replaceAll('√', 'sqrt');
  final expression = Expression.tryParse(string);
  if (expression == null) throw Exception('Invalid expression');

  const evaluator = ExpressionEvaluator();
  num rs = evaluator.eval(expression, {
    '+': (num x, num y) => x + y,
    '-': (num x, num y) => x - y,
    '*': (num x, num y) => x * y,
    '/': (num x, num y) => x / y,
    'factorial': (num x) => _factorial(x),
    'log': (num x) => math.log(x) / math.log(10),
    'sqrt': (num x) => math.sqrt(x),
    'e': math.e,
    'pow': (num base, num exponent) => math.pow(base, exponent),
    'pi': math.pi,
    'sin': (num x) => math.sin(x * math.pi / 180),
    'cos': (num x) => x % 180 == 90 ? 0 : math.cos(x * math.pi / 180),
    'tan': (num x) =>
    math.sin(x * math.pi / 180) /
        (x % 180 == 90 ? 0 : math.cos(x * math.pi / 180)),
    'cot': (num x) =>
    math.cos(x * math.pi / 180) /
        ((x == 0 || x % 180 == 0) ? 0 : math.sin(x * math.pi / 180))
  });

  if (rs.toDouble() > double.maxFinite ||
      rs.toDouble() < double.negativeInfinity) {
    return 'Infinity';
  }
  if (rs > 1e+15 || rs < -1e+15) {
    var result = rs.toStringAsExponential();
    result = result.replaceAll('e', 'E');
    if (!isDotDecimalLocale) {
      result = result.replaceAll('.', ',');
    }
    return result;
  }
  rs = _round(rs.toDouble());
  return _format(rs, isDotDecimalLocale);
}

String _format(num input, bool isDotDecimalLocale) {
  var value = input.toString();
  RegExp reg;
  if (isDotDecimalLocale) {
    reg = RegExp(r'(?<!\.)\b(\d+)');
  } else {
    value = value.replaceAll('.', ',');
    reg = RegExp(r'(?<!,)\b(\d+)');
  }
  value = value.replaceAllMapped(reg, (match) {
    if (match.group(0) == null) return value;
    var num = int.parse(match.group(0)!);
    final localeString = isDotDecimalLocale ? 'en_US' : 'vi_VN';
    var formattedNumber = NumberFormat.decimalPattern(localeString).format(num);
    return formattedNumber;
  });
  final lastChar = isDotDecimalLocale ? '.0' : ',0';
  if (value.endsWith(lastChar)) {
    value = value.replaceFirst(lastChar, '');
  }
  return value;
}

String _replacePower(String input) {
  RegExp regex = RegExp(r'\((.+?)\)\^\((.+?)\)'); // Tìm (A)^(B)

  while (regex.hasMatch(input)) {
    input = input.replaceAllMapped(regex, (match) {
      return "pow(${match.group(1)}, ${match.group(2)})";
    });
  }
  return input;
}

num _factorial(num x) {
  if (x == 0 || x == 1) {
    return 1;
  } else {
    num result = 1;
    for (int i = 2; i <= x; i++) {
      result *= i;
    }
    return result;
  }
}

double _round(double value, [int places = 8]) {
  final list = value.toString().split('.');
  if (list.length == 2 && list.last.length > 8) {
    int mod = math.pow(10, places) as int;
    final newValue = (value * mod).round() / mod;
    debugPrint(newValue.toString());
    return newValue;
  }
  return value;
}
