// import 'package:development_status/model/header_model.dart';
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:googleapis_auth/auth_io.dart' as auth;
// import 'package:googleapis/sheets/v4.dart' as sheets;
// import 'dart:convert';
//
// /// Your google auth credentials
// ///
// /// how to get credentials - https://medium.com/@a.marenkov/how-to-get-credentials-for-google-sheets-456b7e88c430
//
// final _credentials = auth.ServiceAccountCredentials.fromJson({
//   "type": "service_account",
//   "project_id": "developmentprogress-382117",
//   "private_key_id": "aa676e634fcef11a8f33ae70368be5868916ee91",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC9+BXv9j4bnUTx\nLAPB4lY8COYpqq8oXlarwCR1Xmws0FY1wmfltS7NGNnTOiHliBeYEo57rj5DXhw3\nkoAT5eZzSyT8FoRh4nMa/5OTgjqUx2mFCet4bKbhaUimcFm4Xez5nL9RGdlJf3cC\nqtepFt+4X7QidCWZeh44tOHbkGvMnkFqsGxGOE6Ena7Tl622ZgArKO4o/jqclh7d\nDS5eZDBBGB4jo8PbCkYJlvw3ecbZA5gQ9ot50sR2FkztrCLFxDizVcMyrseufGax\nc08jiORWt/Hd0q6uyr1sAUoEbr0qcL8hbwavtvFhha0n4E/3YngX1naDzzOwgvAA\nGGgM0t2rAgMBAAECggEAEf9sDKT2s2UOAA9cd8T6yItLSw1JtPhjG7iDe78rXn+K\ne2NktoWY3oOJN5LdXUKsgZLYfu0+JuHGqJkvmzL/x1KKOXvkpOVwZFFsaOBArpHJ\n9HnBHlKk6NwxrtscFPSJHAj2szdQt77kxpLrBbEOFwiyJ0V7vnOsY1D3yPaA0AzQ\nXzLwHbUw+S148RH6QtQLSGtksToO85rK/atx9aCUUXeJRCgkIIoEGeb21aAEY8pE\nswedbC65nuOezF+dmCAdWUlqnB2TB228mgFwI65wyrSs1GgwBwGlv7MO5MQvGTsB\n6y6BUmMYmvGkimgW+2U3WH4RBZRkjUYBUuB9Z83pSQKBgQDs3MNeGb/H64zlQlrW\nPqq4bnVduc4RLm6w7IKyU5y/K+R9FyghEV0xNvocX7aaGrFGJ/vmup5/lZgu9qXO\nQYF+7DzWL7ZjjlMV9rlBwMnL9JfeGAD22BD0ibIoY7+CtcxdMvHNwWE5ZM8pIcEW\nr9gTWvPI8lqzt/KD7BeCvq0HLQKBgQDNUWMLQs4Xlxv/RK0Oru00q2Xhof6N4bE9\nBW1Edd+lcZBeD9jYpeHUdx6jNbEIYthhm0m0dswhBba9R5z81IHUeoA2YUG78kgS\ncNcSk2pt+MMfJiIEZVBo4psNreqQhxvnTeuTWpa9TeKx3sMZTktSUeAZuvUChTg0\noMWiydN/NwKBgFT3OCnISNBZQbh3nggegLUaAoX1geMN6e0TWirH7YFyKEtrBB0g\nknJ2CzAkcWdETfUhoK36oaKYsfeeyIl9XAuAiK44fU+nHUzSrU/V7U15VwT3TVk+\n1o4x2rO8XFVyC3YfMTgit1KUQ++4SQBvYa5HwQ2DSmAPizIhfamL5pudAoGBAJv4\n6d7SHzH4j0I6b6Up6fULB9iCcZhjDXuntbw+N2m9fciXDUp3qbj3zQR7c0NFo89y\nYml/nc6wQoRD9NR0szQw41lsRL18bpfjtN7dsgpc4g21sD3aoV0sWFHp/rlQijgL\nD5zfQogItOAes+NzgPDGVhH13s7NWUdRoxHpdIu9AoGBAIf1h2aT045waOZTPk+W\n3V6aSdBE73A4kQByhn3FHrv1cs0hdUUI+hhhk4PIfp5FslFylko2qQfj8uRSpLUD\nGUDVqwLh/D7ThknLLsF9TRfzQPeSttBUJx9vIJWZLCwphSJFNG/msG/3LRGkdceW\ntyDsvs4T1HuJNtGq4zvV4HLz\n-----END PRIVATE KEY-----\n",
//   "client_email": "developmentprogress@developmentprogress-382117.iam.gserviceaccount.com",
//   "client_id": "104827247965181130983",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/developmentprogress%40developmentprogress-382117.iam.gserviceaccount.com"
// });
//
// final _scopes = [sheets.SheetsApi.spreadsheetsReadonlyScope];
//
// Future<void> main() async {
//   final client = await clientViaServiceAccount(_credentials, _scopes);
//
//   final sheetsApi = sheets.SheetsApi(client);
//   final spreadsheetId = '1ULbhe5AzhIzTaniNgDpubfMiosN1nZBKqFTgwyKWan8';
//   final range = 'A1:K50'; // Replace with the range of cells you want to retrieve.
//
//   final response = await sheetsApi.spreadsheets.values.get(spreadsheetId, range);
//   final values = response.values!;
//   final headers = values.first;
//   final data = values.skip(1).map((row) => Map.fromIterables(headers, row)).toList();
//   final jsonData = json.encode(data);
//   if (values.isEmpty) {
//     print('No data found.');
//   } else {
//     print('Data:');
//
//   }
//   print(jsonData);
//
//   List<Headers> people = (json.decode(jsonData) as List<dynamic>)
//       .map((json) => Headers(
//     sn: json["सि.नं"]?? '',
//     name: json["योजनाको नाम"]?? '',
//     ward: json["वडा नं"]?? '',
//     planned_budget: json["बिनियोजित बजेट"]?? '',
//     contract_date: json["सम्झौता मिति"]?? '',
//     completion_date: json["सम्पन्न हुने मिति"]?? '',
//     contract_amount: json["सम्झौता रकम"]?? '',
//     progress_physical: json["कार्य प्रगती भौतिक"]?? '',
//     progress_intangible: json["कार्य प्रगती वित्तीय"]?? '',
//     plan_status: json["योजनाको हालको स्थिति"]?? '',
//     vendor: json["निर्माण ब्यवसायी"]?? '',
//   ))
//       .toList();
// // Parse the JSON string
//
// // Convert each item in the list to an instance of the model
//
//   print(people.first.vendor);
// }