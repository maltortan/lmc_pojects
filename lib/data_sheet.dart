// import 'dart:ui';
//
// import 'package:development_status/screens/circular_progress_bar.dart';
// import 'package:development_status/screens/vertical_bar_diagram.dart';
// import 'package:development_status/temp/glass.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// class DataSheet extends StatelessWidget {
//   const DataSheet({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [
//             Colors.blueAccent.withOpacity(0.8),
//             Colors.deepPurple.withOpacity(0.5),
//             Colors.blue.withOpacity(0.6),
//           ])
//         ),
//         alignment: Alignment.center,
//         child: Container(
//           height: height,
//           width: width * .9,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: height*.075,
//                 child: Center(
//                   child: Text('Heading', style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: height*.03
//                   ),),
//                 ),
//               ),
//               Container(
//                 width: width*9,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: height*.75,
//                       width: width*.45,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           gradient: LinearGradient(colors: [
//                             Colors.white.withOpacity(0.8),
//                             Colors.white.withOpacity(0.4)
//                           ])),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           ShortTextCard(
//                             title: "वडा नं:",
//                             subtitle: "\र\ू२७००६८९४.९७",
//                             icon: Icons.access_alarm,
//                             color: Colors.blue,
//                           ),
//                           ShortTextCard(
//                             title: "बिनियोजित बजेट:",
//                             subtitle: "Subtitle 2",
//                             icon: Icons.accessibility,
//                             color: Colors.red,
//                           ),
//                           ShortTextCard(
//                             title: "सम्झौता मिति:",
//                             subtitle: "\र\ू२७००६८९४.९७",
//                             icon: Icons.access_alarm,
//                             color: Colors.blue,
//                           ),
//                           ShortTextCard(
//                             title: "सम्पन्न हुने मिति:",
//                             subtitle: "\र\ू२७००६८९४.९७",
//                             icon: Icons.access_alarm,
//                             color: Colors.green,
//                           ),
//                           ShortTextCard(
//                             title: "निर्माण ब्यवसायी:",
//                             subtitle: "\र\ू२७००६८९४.९७",
//                             icon: Icons.access_alarm,
//                             color: Colors.blue,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: height*.8,
//                       child: Column(
//
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             height: height*.32,
//                             width: width*.3,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//
//                               gradient: LinearGradient(
//                                 colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.4)],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(16),
//                                   color: Colors.white.withOpacity(0.1),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//
//                                       Row(
//                                         children: [
//                                           Transform.rotate(
//                                             angle: -math.pi / 4,
//                                             child: Container(
//                                               width: 48,
//                                               height: 48,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.green.withOpacity(0.5),
//                                                 borderRadius: BorderRadius.circular(10),
//                                               ),
//
//                                             ),
//                                           ),
//                                           SizedBox(width: 18),
//                                           Text(
//                                             'भौतिक प्रगती:',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: 8),
//                                       CircularProgressBar(
//                                         percentage: 90,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.all(16),
//                                   color: Colors.white.withOpacity(0.1),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//
//                                       Row(
//                                         children: [
//                                           Transform.rotate(
//                                             angle: -math.pi / 4,
//                                             child: Container(
//                                               width: 48,
//                                               height: 48,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.green.withOpacity(0.5),
//                                                 borderRadius: BorderRadius.circular(10),
//                                               ),
//
//                                             ),
//                                           ),
//                                           SizedBox(width: 18),
//                                           Text(
//                                             'वित्तीय प्रगती:',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: 8),
//                                       CircularProgressBar(
//                                         percentage: 10,
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                               height: height*.35,
//                               width: width*.3,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   gradient: LinearGradient(colors: [
//                                     Colors.white.withOpacity(0.8),
//                                     Colors.white.withOpacity(0.4)
//                                   ])),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           VerticalBarDiagram(values: [
//                                             1,
//                                             0.8,
//                                             0.6
//                                           ], colors: [
//                                             Colors.black87,
//                                             Colors.green,
//                                             Colors.greenAccent
//                                           ], height: height * .25, width: width*.1, maxValue: 1),
//
//                                         ],
//                                       ),
//                                       Container(
//                                         height: height*.08,
//                                         padding: EdgeInsets.only(left: width*.015),
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   height: height*.02,
//                                                   width: height*.02,
//                                                   color: Colors.black87,
//                                                 ),
//                                                 SizedBox(
//                                                   width: width*.005,
//                                                 ),
//                                                 Text('Total Budget')
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   height: height*.02,
//                                                   width: height*.02,
//                                                   color: Colors.green,
//                                                 ),
//                                                 SizedBox(
//                                                   width: width*.005,
//                                                 ),
//                                                 Text('Remaining Budget')
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   height: height*.02,
//                                                   width: height*.02,
//                                                   color: Colors.greenAccent,
//                                                 ),
//                                                 SizedBox(
//                                                   width: width*.005,
//                                                 ),
//                                                 Text('Currently')
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: height*.1,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text('बिनियोजित बजेट:  ',style: TextStyle(
//                                               fontSize: width*.01,
//                                             ),),
//                                             Text('Rs. 8 Crore',style: TextStyle(
//                                                 fontSize: width*.01,
//                                                 fontWeight: FontWeight.bold),),
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text('प्रयोग गरिएको बजेट:  ',style: TextStyle(
//                                               fontSize: width*.01,
//                                             ),),
//                                             Text('Rs. 8 Crore',style: TextStyle(
//                                                 fontSize: width*.01,
//                                                 fontWeight: FontWeight.bold),),
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text('वर्तमान स्थिति:  ',style: TextStyle(
//                                               fontSize: width*.01,
//                                             ),),
//                                             Text('Over or Below Budget',style: TextStyle(
//                                                 fontSize: width*.01,
//                                                 fontWeight: FontWeight.bold),),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ))
//
//                         ],
//                       ),
//                     ),
//
//
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
