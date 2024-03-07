double convertNumberString(String numberString) {
  double number = double.tryParse(numberString) ?? 0.0;
  String formattedNumber;

  if (number.truncate() > 0) {
    formattedNumber = number.toStringAsFixed(2); // If the integer part is greater than 0, return with 2 decimal places
  } else {
    formattedNumber = number.toStringAsFixed(8); // If the integer part is 0, return with 8 decimal places
  }

  // Remove leading zeros in the decimal part
  if (formattedNumber.contains('.')) {
    List<String> parts = formattedNumber.split('.');
    parts[1] = parts[1].replaceAll(RegExp(r'^0+'), '');
    formattedNumber = parts.join('.');
  }

  return double.parse(formattedNumber);
}