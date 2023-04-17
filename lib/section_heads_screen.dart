import 'dart:async';
import 'dart:convert';

import 'package:development_status/components/color_changing_progress_indicator.dart';
import 'package:development_status/components/fancy%20loader.dart';
import 'package:development_status/homepage.dart';
import 'package:development_status/model/section_head_weekly_tasks.dart';
import 'package:development_status/temp/design2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:intl/intl.dart';

final _credentials = auth.ServiceAccountCredentials.fromJson({
  "type": "service_account",
  "project_id": "developmentprogress-382117",
  "private_key_id": "aa676e634fcef11a8f33ae70368be5868916ee91",
  "private_key":
      "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC9+BXv9j4bnUTx\nLAPB4lY8COYpqq8oXlarwCR1Xmws0FY1wmfltS7NGNnTOiHliBeYEo57rj5DXhw3\nkoAT5eZzSyT8FoRh4nMa/5OTgjqUx2mFCet4bKbhaUimcFm4Xez5nL9RGdlJf3cC\nqtepFt+4X7QidCWZeh44tOHbkGvMnkFqsGxGOE6Ena7Tl622ZgArKO4o/jqclh7d\nDS5eZDBBGB4jo8PbCkYJlvw3ecbZA5gQ9ot50sR2FkztrCLFxDizVcMyrseufGax\nc08jiORWt/Hd0q6uyr1sAUoEbr0qcL8hbwavtvFhha0n4E/3YngX1naDzzOwgvAA\nGGgM0t2rAgMBAAECggEAEf9sDKT2s2UOAA9cd8T6yItLSw1JtPhjG7iDe78rXn+K\ne2NktoWY3oOJN5LdXUKsgZLYfu0+JuHGqJkvmzL/x1KKOXvkpOVwZFFsaOBArpHJ\n9HnBHlKk6NwxrtscFPSJHAj2szdQt77kxpLrBbEOFwiyJ0V7vnOsY1D3yPaA0AzQ\nXzLwHbUw+S148RH6QtQLSGtksToO85rK/atx9aCUUXeJRCgkIIoEGeb21aAEY8pE\nswedbC65nuOezF+dmCAdWUlqnB2TB228mgFwI65wyrSs1GgwBwGlv7MO5MQvGTsB\n6y6BUmMYmvGkimgW+2U3WH4RBZRkjUYBUuB9Z83pSQKBgQDs3MNeGb/H64zlQlrW\nPqq4bnVduc4RLm6w7IKyU5y/K+R9FyghEV0xNvocX7aaGrFGJ/vmup5/lZgu9qXO\nQYF+7DzWL7ZjjlMV9rlBwMnL9JfeGAD22BD0ibIoY7+CtcxdMvHNwWE5ZM8pIcEW\nr9gTWvPI8lqzt/KD7BeCvq0HLQKBgQDNUWMLQs4Xlxv/RK0Oru00q2Xhof6N4bE9\nBW1Edd+lcZBeD9jYpeHUdx6jNbEIYthhm0m0dswhBba9R5z81IHUeoA2YUG78kgS\ncNcSk2pt+MMfJiIEZVBo4psNreqQhxvnTeuTWpa9TeKx3sMZTktSUeAZuvUChTg0\noMWiydN/NwKBgFT3OCnISNBZQbh3nggegLUaAoX1geMN6e0TWirH7YFyKEtrBB0g\nknJ2CzAkcWdETfUhoK36oaKYsfeeyIl9XAuAiK44fU+nHUzSrU/V7U15VwT3TVk+\n1o4x2rO8XFVyC3YfMTgit1KUQ++4SQBvYa5HwQ2DSmAPizIhfamL5pudAoGBAJv4\n6d7SHzH4j0I6b6Up6fULB9iCcZhjDXuntbw+N2m9fciXDUp3qbj3zQR7c0NFo89y\nYml/nc6wQoRD9NR0szQw41lsRL18bpfjtN7dsgpc4g21sD3aoV0sWFHp/rlQijgL\nD5zfQogItOAes+NzgPDGVhH13s7NWUdRoxHpdIu9AoGBAIf1h2aT045waOZTPk+W\n3V6aSdBE73A4kQByhn3FHrv1cs0hdUUI+hhhk4PIfp5FslFylko2qQfj8uRSpLUD\nGUDVqwLh/D7ThknLLsF9TRfzQPeSttBUJx9vIJWZLCwphSJFNG/msG/3LRGkdceW\ntyDsvs4T1HuJNtGq4zvV4HLz\n-----END PRIVATE KEY-----\n",
  "client_email":
      "developmentprogress@developmentprogress-382117.iam.gserviceaccount.com",
  "client_id": "104827247965181130983",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url":
      "https://www.googleapis.com/robot/v1/metadata/x509/developmentprogress%40developmentprogress-382117.iam.gserviceaccount.com"
});

final _scopes = [sheets.SheetsApi.spreadsheetsReadonlyScope];

class SectionHeads extends StatefulWidget {
  SectionHeads({Key? key}) : super(key: key);

  @override
  State<SectionHeads> createState() => _SectionHeadsState();
}

class _SectionHeadsState extends State<SectionHeads> {
  int _currentPage = 0;

  late Timer _timer;

  PageController _pageController = PageController(
    initialPage: 0,
  );
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {

    super.initState();
    _timer = Timer.periodic(Duration(seconds: 30), (Timer timer) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 2000),
        curve: Curves.easeInOutCubicEmphasized,
      );
    });
    Timer.periodic(Duration(seconds: 15), (Timer timer) {
      print('scroll started');
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder<List<HeadTasks>>(
        future: getTaskData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              List<HeadTasks> dataArray = snapshot.data!;
              List<HeadTasks> dateFiltered = filterDataByOneWeek(dataArray);
              dateFiltered.sort((a, b) => b.timestamp.compareTo(a.timestamp));
              List<String> uniqueData = [];

              for (var data in dateFiltered) {
                if (!uniqueData.contains(data.section)) {
                  uniqueData.add(data.section);
                }
              }
              return PageView.builder(
                  controller: _pageController,
                  itemCount: uniqueData.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<HeadTasks> filteredData = [];
                    for (var data in dataArray) {
                      if (data.section == uniqueData[index]) {
                        filteredData.add(data);
                      }
                    }
                    if((uniqueData.length-1)==index){
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        // This code will be executed after the build process is complete
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Homepage()));
                      });
                    }
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blueAccent.withOpacity(0.7),
                          Colors.blueGrey.withOpacity(0.5),
                          Colors.deepPurple.withOpacity(0.3),
                          Colors.purpleAccent.withOpacity(0.2),
                        ],begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: height*.05,),
                          Center(
                            child: Text(
                              uniqueData[index].toUpperCase()+"को  आ.व. २०७९ /८० को \nहाल सम्मको कार्य प्रगती",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tiroDevanagariHindi(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: width*.03,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                          SizedBox(height: height*.02,),
                          SizedBox(
                            height: height*.75,
                            width: width*.8,
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: filteredData.length,
                                itemBuilder: (context,index){
                              return Padding(
                                padding: EdgeInsets.only(bottom: height*.02),
                                child: FittedBox(
                                  child: TextStatWidget(
                                      label: filteredData[index].day,
                                      value: filteredData[index].workDetails,
                                      status: (filteredData[index].status=="भएको")?true:false,
                                      color: Colors.green),
                                ),
                              );

                            }),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return SizedBox(
                height: height,
                width: width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text('ललितपुर महनगरपालिकाका \n महाशाखा‍/शाखा प्रमुखहरुको \n कार्य विवरण',
                        textAlign: TextAlign.center,
                        style:  GoogleFonts.tiroDevanagariHindi(
                            fontSize: height*.07,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold
                        )
                       ),
                      SizedBox(height: height*.05,),
                      LinearFancyLoader(),
                    ],
                  ),
                ),
              );
            }
          } else {
            return SizedBox(
              height: height,
              width: width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text('ललितपुर महनगरपालिकाका \n महाशाखा‍/शाखा प्रमुखहरुको \n कार्य प्रगती...',
                      textAlign: TextAlign.center,
                      style:  GoogleFonts.tiroDevanagariHindi(
                          fontSize: height*.07,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold
                      )
                     ),
                    SizedBox(height: height*.05,),
                    LinearFancyLoader(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

Future<List<HeadTasks>> getTaskData() async {
  final client = await clientViaServiceAccount(_credentials, _scopes);

  final sheetsApi = sheets.SheetsApi(client);
  final spreadsheetId = '1yXY-Y29JiiPSnBTeWP8KmYOIDR8x02yFLpqoq5raNgQ';
  final range =
      'A1:E1000'; // Replace with the range of cells you want to retrieve.

  final response =
      await sheetsApi.spreadsheets.values.get(spreadsheetId, range);
  final values = response.values!;
  final headers = values.first;

  final data =
      values.skip(1).map((row) => Map.fromIterables(headers, row)).toList();
  final jsonData = json.encode(data);
  if (values.isEmpty) {
    print('No data found.');
  } else {
    print('Data:');
  }

  List<HeadTasks> people = (json.decode(jsonData) as List<dynamic>)
      .map((json) => HeadTasks(
            timestamp: json["Timestamp"] ?? '',
            section: json["महाशाखा/ शाखा"] ?? '',
            day: json["मिति"] ?? '',
            workDetails: json["कार्य विवरण"] ?? '',
            status: json["कार्य सम्पन्न भए/नभएको"] ?? '',
          ))
      .toList();

  return people;
}

List<HeadTasks> filterDataByOneWeek(List<HeadTasks> data) {
  final today = DateTime.now();
  final format = DateFormat('MM/dd/yyyy');
  final oneWeekAgo = today.subtract(Duration(days: 365));

  final filteredData = data.where((item) {
    // Filter the data if the timestamp is within one week from today
    return format.parse(item.timestamp).isAfter(oneWeekAgo) && format.parse(item.timestamp).isBefore(today);
  }).toList();

  return filteredData;
}
