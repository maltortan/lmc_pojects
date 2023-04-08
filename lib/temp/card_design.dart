// import 'package:flutter/material.dart';
//
// class ShortTextCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final Color color;
//
//   ShortTextCard({
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(
//               icon,
//               color: color,
//               size: 32,
//             ),
//             SizedBox(height: 16),
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               subtitle,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 12,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TwoColumnCardLayout extends StatelessWidget {
//   final List<ShortTextCard> cards;
//
//   TwoColumnCardLayout({required this.cards});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             children: cards
//                 .sublist(0, (cards.length / 2).ceil())
//                 .map((card) => Padding(
//               padding: EdgeInsets.symmetric(vertical: 8),
//               child: card,
//             ))
//                 .toList(),
//           ),
//         ),
//         Expanded(
//           child: Column(
//             children: cards
//                 .sublist((cards.length / 2).ceil())
//                 .map((card) => Padding(
//               padding: EdgeInsets.symmetric(vertical: 8),
//               child: card,
//             ))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
