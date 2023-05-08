import 'dart:async';

import 'package:development_status/components/convert_nepali.dart';
import 'package:development_status/components/fancy%20loader.dart';
import 'package:development_status/components/tween_animating_bardiagram.dart';
import 'package:development_status/model/header_model.dart';
import 'package:development_status/providers/page_view_provider.dart';
import 'package:development_status/screens/circular_progress_bar.dart';
import 'package:development_status/screens/vertical_bar_diagram.dart';
import 'package:development_status/section_heads_screen.dart';
import 'package:development_status/temp/glass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui' as ui;
import 'dart:html';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

final _credentials = auth.ServiceAccountCredentials.fromJson({
  "type": "service_account",
  "project_id": "developmentprogress-382117",
  "private_key_id": "aa676e634fcef11a8f33ae70368be5868916ee91",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC9+BXv9j4bnUTx\nLAPB4lY8COYpqq8oXlarwCR1Xmws0FY1wmfltS7NGNnTOiHliBeYEo57rj5DXhw3\nkoAT5eZzSyT8FoRh4nMa/5OTgjqUx2mFCet4bKbhaUimcFm4Xez5nL9RGdlJf3cC\nqtepFt+4X7QidCWZeh44tOHbkGvMnkFqsGxGOE6Ena7Tl622ZgArKO4o/jqclh7d\nDS5eZDBBGB4jo8PbCkYJlvw3ecbZA5gQ9ot50sR2FkztrCLFxDizVcMyrseufGax\nc08jiORWt/Hd0q6uyr1sAUoEbr0qcL8hbwavtvFhha0n4E/3YngX1naDzzOwgvAA\nGGgM0t2rAgMBAAECggEAEf9sDKT2s2UOAA9cd8T6yItLSw1JtPhjG7iDe78rXn+K\ne2NktoWY3oOJN5LdXUKsgZLYfu0+JuHGqJkvmzL/x1KKOXvkpOVwZFFsaOBArpHJ\n9HnBHlKk6NwxrtscFPSJHAj2szdQt77kxpLrBbEOFwiyJ0V7vnOsY1D3yPaA0AzQ\nXzLwHbUw+S148RH6QtQLSGtksToO85rK/atx9aCUUXeJRCgkIIoEGeb21aAEY8pE\nswedbC65nuOezF+dmCAdWUlqnB2TB228mgFwI65wyrSs1GgwBwGlv7MO5MQvGTsB\n6y6BUmMYmvGkimgW+2U3WH4RBZRkjUYBUuB9Z83pSQKBgQDs3MNeGb/H64zlQlrW\nPqq4bnVduc4RLm6w7IKyU5y/K+R9FyghEV0xNvocX7aaGrFGJ/vmup5/lZgu9qXO\nQYF+7DzWL7ZjjlMV9rlBwMnL9JfeGAD22BD0ibIoY7+CtcxdMvHNwWE5ZM8pIcEW\nr9gTWvPI8lqzt/KD7BeCvq0HLQKBgQDNUWMLQs4Xlxv/RK0Oru00q2Xhof6N4bE9\nBW1Edd+lcZBeD9jYpeHUdx6jNbEIYthhm0m0dswhBba9R5z81IHUeoA2YUG78kgS\ncNcSk2pt+MMfJiIEZVBo4psNreqQhxvnTeuTWpa9TeKx3sMZTktSUeAZuvUChTg0\noMWiydN/NwKBgFT3OCnISNBZQbh3nggegLUaAoX1geMN6e0TWirH7YFyKEtrBB0g\nknJ2CzAkcWdETfUhoK36oaKYsfeeyIl9XAuAiK44fU+nHUzSrU/V7U15VwT3TVk+\n1o4x2rO8XFVyC3YfMTgit1KUQ++4SQBvYa5HwQ2DSmAPizIhfamL5pudAoGBAJv4\n6d7SHzH4j0I6b6Up6fULB9iCcZhjDXuntbw+N2m9fciXDUp3qbj3zQR7c0NFo89y\nYml/nc6wQoRD9NR0szQw41lsRL18bpfjtN7dsgpc4g21sD3aoV0sWFHp/rlQijgL\nD5zfQogItOAes+NzgPDGVhH13s7NWUdRoxHpdIu9AoGBAIf1h2aT045waOZTPk+W\n3V6aSdBE73A4kQByhn3FHrv1cs0hdUUI+hhhk4PIfp5FslFylko2qQfj8uRSpLUD\nGUDVqwLh/D7ThknLLsF9TRfzQPeSttBUJx9vIJWZLCwphSJFNG/msG/3LRGkdceW\ntyDsvs4T1HuJNtGq4zvV4HLz\n-----END PRIVATE KEY-----\n",
  "client_email": "developmentprogress@developmentprogress-382117.iam.gserviceaccount.com",
  "client_id": "104827247965181130983",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/developmentprogress%40developmentprogress-382117.iam.gserviceaccount.com"
});

final _scopes = [sheets.SheetsApi.spreadsheetsReadonlyScope];
class _HomepageState extends State<Homepage> {
  int _currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 50), (Timer timer) {
        _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.removeListener((){});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder<List<Headers>>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return PageView.builder(
              controller: _pageController,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Headers data = snapshot.data![index];
                String myString = data.images;
                double? physical_progress = double.tryParse(data.progress_physical);
                double? intangible_progress = double.tryParse(data.progress_intangible);
                print({data.progress_physical,data.progress_intangible});
                print({physical_progress,intangible_progress});
                print(myString);
                if(_currentPage==snapshot.data!.length-1){
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // This code will be executed after the build process is complete
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SectionHeads()));
                  });
                }
                if(!myString.contains('nan')){

                  print('images');
                  List<String> myArray = myString.split(",");
                  bool pro_count = true;
                  _timer.cancel();
                  _pageController.removeListener((){});
                  _timer = Timer.periodic(Duration(seconds: (myArray.length*10)+10), (Timer timer) {
                    _currentPage++;
                    _pageController.animateToPage(
                      _currentPage,
                      duration: Duration(milliseconds: 1500),
                      curve: Curves.easeIn,
                    );
                  });
                  print({'My array length',myArray.length});
                  print(myArray);
                  return CarouselSlider.builder(
                    itemCount: myArray.length,
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
                        if(pro_count){
                          print(pro_count);
                          pro_count=false;
                          Provider.of<PageViewProvider>(context, listen: false).imageUrl(myArray[itemIndex].toString());
                          return Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blueAccent.withOpacity(0.8),
                                  Colors.deepPurple.withOpacity(0.5),
                                  Colors.blue.withOpacity(0.6),
                                ])
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              height: height,
                              width: width * .9,
                              child: Column(
                                children: [
                                  //Heading
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: width*.02),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.4)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    height: height*.18,
                                    width: width*.8,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: height*.12,
                                          child: FittedBox(
                                            child: Center(
                                              child: Text(data.name, style: GoogleFonts.tiroDevanagariHindi(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: height*.052
                                              )
                                             ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: height*.05,
                                          width: width*.8,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text('Contact Person: ', style: GoogleFonts.tiroDevanagariHindi(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: height*.032
                                              )),
                                              Container(
                                                alignment: Alignment.centerRight,
                                                child: Text(data.responsible_person, style: GoogleFonts.tiroDevanagariHindi(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: height*.032
                                                )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: width*9,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: height*.75,
                                          width: width*.45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              gradient: LinearGradient(colors: [
                                                Colors.white.withOpacity(0.8),
                                                Colors.white.withOpacity(0.4)
                                              ])),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ShortTextCard(
                                                title: "वडा नं:",
                                                subtitle: data.ward,
                                                icon: 'ward.png',
                                                color: Colors.blue,
                                              ),
                                              ShortTextCard(
                                                title: "बिनियोजित बजेट:",
                                                subtitle: data.planned_budget,
                                                icon: 'budget.png',
                                                color: Colors.red,
                                              ),
                                              ShortTextCard(
                                                title: "सम्झौता मिति:",
                                                subtitle: data.contract_date,
                                                icon: 'contract.png',
                                                color: Colors.blue,
                                              ),
                                              ShortTextCard(
                                                title: "सम्पन्न हुने मिति:",
                                                subtitle: data.completion_date,
                                                icon: 'finish.png',
                                                color: Colors.green,
                                              ),
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Container(
                                                  padding: EdgeInsets.only(left: width*.015, right: width*.015),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Transform.rotate(
                                                            angle: -math.pi / 4,
                                                            child: Container(
                                                              width: width*.04,
                                                              height: width*.04,
                                                              padding: EdgeInsets.all(width*.01),
                                                              decoration: BoxDecoration(
                                                                color: Colors.deepOrange.withOpacity(0.7),
                                                                borderRadius: BorderRadius.circular(10),
                                                              ),
                                                              child: Image.asset('assets/icon/contractor.png', color: Colors.white,),
                                                            ),
                                                          ),
                                                          SizedBox(width: width*.02),
                                                          Text(
                                                            'निर्माण व्यवसायीः ',
                                                            style: GoogleFonts.tiroDevanagariHindi(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: width*.020,
                                                            )

                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: width*.01),
                                                        child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                            data.vendor,
                                                            style: GoogleFonts.tiroDevanagariHindi(
                                                              color: Colors.black87,
                                                              fontSize: width*.020,
                                                          )

                                                          ),
                                                        ),

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: height*.8,
                                          child: Column(

                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: height*.32,
                                                width: width*.3,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),

                                                  gradient: LinearGradient(
                                                    colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.4)],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(16),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Row(
                                                            children: [
                                                              Transform.rotate(
                                                                angle: -math.pi / 4,
                                                                child: Container(
                                                                  width: 48,
                                                                  height: 48,
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.green.withOpacity(0.5),
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                  child: Image.asset('assets/icon/tangible.png', color: Colors.white),
                                                                ),
                                                              ),
                                                              SizedBox(width: 18),
                                                              Text(
                                                                'भौतिक प्रगती:',
                                                                style: GoogleFonts.tiroDevanagariHindi(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: width*.025,
                                                                )
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: height*.015),
                                                          CircularProgressBar(
                                                            percentage: physical_progress??0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(16),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Row(
                                                            children: [
                                                              Transform.rotate(
                                                                angle: -math.pi / 4,
                                                                child: Container(
                                                                  width: 48,
                                                                  height: 48,
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.green.withOpacity(0.5),
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                  child: Image.asset('assets/icon/intangible.png', color: Colors.white),
                                                                ),
                                                              ),
                                                              SizedBox(width: 18),
                                                              Text(
                                                                'वित्तीय प्रगती:',
                                                                style: GoogleFonts.tiroDevanagariHindi(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: width*.025,
                                                                )
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 8),
                                                          CircularProgressBar(
                                                            percentage: intangible_progress??0,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              //Status
                                              Container(
                                                  padding: EdgeInsets.only(left: width*.02, right: width*.02, top: height*.02),
                                                  height: height*.35,
                                                  width: width*.3,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(30),
                                                      gradient: LinearGradient(colors: [
                                                        Colors.white.withOpacity(0.8),
                                                        Colors.white.withOpacity(0.4)
                                                      ])),
                                                  child: Column(
                                                    children: [
                                                      Text('योजनाको हालको स्थिति', style: GoogleFonts.tiroDevanagariHindi(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: width*.020,
                                                      )),
                                                      Text(data.plan_status,
                                                          maxLines: 5,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.justify,
                                                          style: GoogleFonts.tiroDevanagariHindi(
                                                            fontSize: width*.016,
                                                          )),
                                                    ],
                                                  ),)

                                            ],
                                          ),
                                        ),



                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }else{

                          print('boolean for 1st page');
                          print(pro_count);
                          print('index of pageview');
                          print(index);
                          print(myArray);
                          print('index of array item');
                          print(itemIndex);
                          print(myArray[itemIndex].toString());
                          Provider.of<PageViewProvider>(context, listen: false).imageUrl(myArray[itemIndex].toString());
                          String img_src = Provider.of<PageViewProvider>(context, listen: true).image_url;
                          ui.platformViewRegistry.registerViewFactory(
                              'hello-html',
                                  (int viewId) {
                                return getImage(img_src);
                              }
                          );
                          return Column(
                            children: [
                              SizedBox(
                                height: height*.1,
                                child: Center(
                                  child: Text(data.name, style: GoogleFonts.tiroDevanagariHindi(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: height*.05
                                  ) ),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  color: Colors.grey,
                                  height: height*.9,
                                  width: width*.8,
                                  child: HtmlElementView(viewType: 'hello-html')
                              ),
                            ],
                          );
                        }
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 12)
                    ),
                  );
                }else{
                  print('no images');
                  _timer.cancel();
                  _pageController.removeListener((){});
                  _timer = Timer.periodic(Duration(seconds: 15), (Timer timer) {
                    _currentPage++;
                    _pageController.animateToPage(
                      _currentPage,
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeIn,
                    );
                  });
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blueAccent.withOpacity(0.8),
                          Colors.deepPurple.withOpacity(0.5),
                          Colors.blue.withOpacity(0.6),
                        ])
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      height: height,
                      width: width * .9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: width*.02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.4)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            height: height*.18,
                            width: width*.8,
                            child: Column(
                              children: [
                                Container(
                                  height: height*.12,
                                  child: FittedBox(
                                    child: Center(
                                      child: Text(data.name, style: GoogleFonts.tiroDevanagariHindi(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: height*.052
                                      )
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height*.05,
                                  width: width*.8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('Contact Person: ', style: GoogleFonts.tiroDevanagariHindi(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: height*.032
                                      )),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(data.responsible_person, style: GoogleFonts.tiroDevanagariHindi(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: height*.032
                                        )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Heading

                          Container(
                            width: width*9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: height*.75,
                                  width: width*.45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(colors: [
                                        Colors.white.withOpacity(0.8),
                                        Colors.white.withOpacity(0.4)
                                      ])),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ShortTextCard(
                                        title: "वडा नं:",
                                        subtitle: data.ward,
                                        icon: 'ward.png',
                                        color: Colors.blue,
                                      ),
                                      ShortTextCard(
                                        title: "बिनियोजित बजेट:",
                                        subtitle: data.planned_budget,
                                        icon: 'budget.png',
                                        color: Colors.red,
                                      ),
                                      ShortTextCard(
                                        title: "सम्झौता मिति:",
                                        subtitle: data.contract_date,
                                        icon: 'contract.png',
                                        color: Colors.blue,
                                      ),
                                      ShortTextCard(
                                        title: "सम्पन्न हुने मिति:",
                                        subtitle: data.completion_date,
                                        icon: 'finish.png',
                                        color: Colors.green,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Container(
                                          padding: EdgeInsets.only(left: width*.015, right: width*.015),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Transform.rotate(
                                                    angle: -math.pi / 4,
                                                    child: Container(
                                                      width: width*.04,
                                                      height: width*.04,
                                                      padding: EdgeInsets.all(width*.01),
                                                      decoration: BoxDecoration(
                                                        color: Colors.orangeAccent.withOpacity(0.9),
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Image.asset('assets/icon/contractor.png', color: Colors.white,)
                                                    ),
                                                  ),
                                                  SizedBox(width: width*.02),
                                                  Text(
                                                    'निर्माण व्यवसायीः ',
                                                    style: GoogleFonts.tiroDevanagariHindi(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: width*.020,
                                                    )

                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: width*.01),
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    data.vendor,
                                                    style: GoogleFonts.tiroDevanagariHindi(
                                                      color: Colors.black87,
                                                      fontSize: width*.020,
                                                    )
                                                  ),
                                                ),

                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: height*.8,
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: height*.32,
                                        width: width*.3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),

                                          gradient: LinearGradient(
                                            colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.4)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(16),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [

                                                  Row(
                                                    children: [
                                                      Transform.rotate(
                                                        angle: -math.pi / 4,
                                                        child: Container(
                                                          width: 48,
                                                          height: 48,
                                                          decoration: BoxDecoration(
                                                            color: Colors.green.withOpacity(0.5),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Image.asset('assets/icon/tangible.png', color: Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(width: 18),
                                                      Text(
                                                          'भौतिक प्रगती:',
                                                          style: GoogleFonts.tiroDevanagariHindi(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: width*.025,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: height*.015),
                                                  CircularProgressBar(
                                                    percentage: physical_progress??0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(16),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [

                                                  Row(
                                                    children: [
                                                      Transform.rotate(
                                                        angle: -math.pi / 4,
                                                        child: Container(
                                                          width: 48,
                                                          height: 48,
                                                          decoration: BoxDecoration(
                                                            color: Colors.green.withOpacity(0.5),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Image.asset('assets/icon/intangible.png', color: Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(width: 18),
                                                      Text(
                                                          'वित्तीय प्रगती:',
                                                          style: GoogleFonts.tiroDevanagariHindi(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: width*.025,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  CircularProgressBar(
                                                    percentage: intangible_progress??0,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: width*.02, right: width*.02, top: height*.02),
                                        height: height*.35,
                                        width: width*.3,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            gradient: LinearGradient(colors: [
                                              Colors.white.withOpacity(0.8),
                                              Colors.white.withOpacity(0.4)
                                            ])),
                                        child: Column(
                                          children: [
                                            Text('योजनाको हालको स्थिति', style: GoogleFonts.tiroDevanagariHindi(
                                              fontWeight: FontWeight.bold,
                                              fontSize: width*.020,
                                            )),
                                            Text(data.plan_status,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.justify,
                                                style: GoogleFonts.tiroDevanagariHindi(
                                                  fontSize: width*.016,
                                                )),
                                          ],
                                        ),)

                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

              },
            );
          }else{
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text('ललितपुर महानगरपालिका:\nयोजना प्रगति विवरण',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tiroDevanagariHindi(
                      fontSize: height*.07,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold
                  )
                 ),
                SizedBox(height: height*.05,),
                LinearFancyLoader(),
              ],
            ));
          }

        },
      )
    );
  }
  ImageElement getImage(String image){
    print({'function',Provider.of<PageViewProvider>(context, listen: true).image_url});
    return ImageElement()..src = "https://drive.google.com/uc?id="+ Provider.of<PageViewProvider>(context, listen: true).image_url;
  }
}
Future<List<Headers>> getData() async {
  final client = await clientViaServiceAccount(_credentials, _scopes);

  final sheetsApi = sheets.SheetsApi(client);
  final spreadsheetId = '10oIk-DZ45S3qyFHMFEr-D1HolgcKUN3aUTe-IeQAYFg';
  final range = 'A1:M50'; // Replace with the range of cells you want to retrieve.

  final response = await sheetsApi.spreadsheets.values.get(spreadsheetId, range);
  final values = response.values!;
  final headers = values.first;

  final data = values.skip(1).map((row) => Map.fromIterables(headers, row)).toList();
  final jsonData = json.encode(data);
  if (values.isEmpty) {
    print('No data found.');
  } else {
    print('Data:');
    print(jsonData);
  }

  List<Headers> people = (json.decode(jsonData) as List<dynamic>)
      .map((json) => Headers(
    sn: json["सि.नं"]?? '',
    name: json["योजनाको नाम"]?? '',
    ward: json["वडा नं"]?? '',
    planned_budget: json["बिनियोजित बजेट"]?? '',
    contract_date: json["सम्झौता मिति"]?? '',
    completion_date: json["सम्पन्न हुने मिति"]?? '',
    contract_amount: json["सम्झौता रकम"]?? '',
    progress_physical: json["कार्य प्रगती भौतिक"]?? '',
    progress_intangible: json["कार्य प्रगती वित्तीय"]?? '',
    plan_status: json["योजनाको हालको स्थिति"]?? '',
    responsible_person: json["सम्वनधित व्यक्ति"]?? '',
    vendor: json["निर्माण ब्यवसायी"]?? '',
    images: json["images_url"]?? '',
  ))
      .toList();
// Parse the JSON string

// Convert each item in the list to an instance of the model

  return people;
}

