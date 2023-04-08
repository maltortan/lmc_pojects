String convertToNepali(String value) {
  // Define the mapping of English digits to Nepali digits
  Map<String, String> digitsMap = {
    "0": "०",
    "1": "१",
    "2": "२",
    "3": "३",
    "4": "४",
    "5": "५",
    "6": "६",
    "7": "७",
    "8": "८",
    "9": "९"
  };

  // Split the input value into integer and fractional parts
  List<String> parts = value.split('.');

  // Convert the integer part to Nepali digits
  String integerPart = parts[0];
  String nepaliIntegerPart = "";
  for (int i = 0; i < integerPart.length; i++) {
    String digit = integerPart[i];
    String? nepaliDigit = digitsMap[digit];
    nepaliIntegerPart += nepaliDigit != null ? nepaliDigit : digit;
  }

  // Combine the integer and fractional parts back into a single Nepali value
  if (parts.length > 1) {
    String fractionalPart = parts[1];
    String nepaliFractionalPart = "";
    for (int i = 0; i < fractionalPart.length; i++) {
      String digit = fractionalPart[i];
      String? nepaliDigit = digitsMap[digit];
      nepaliFractionalPart += nepaliDigit != null ? nepaliDigit : digit;
    }
    return '$nepaliIntegerPart.$nepaliFractionalPart';
  } else {
    return nepaliIntegerPart;
  }
}
