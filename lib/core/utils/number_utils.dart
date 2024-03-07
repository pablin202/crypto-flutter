double calculatePercentageDifference(double number1, double number2) {
  if (number1 == number2) {
    return 0.0; // If the numbers are equal, the percentage difference is 0
  }

  double difference = number2 - number1;
  double percentageDifference = (difference / number1) * 100;

  return double.parse(percentageDifference.toStringAsFixed(2));
}
