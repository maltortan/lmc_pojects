import 'package:development_status/appscroll.dart';
import 'package:development_status/homepage.dart';
import 'package:development_status/providers/page_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PageViewProvider>(
          create: (context) => PageViewProvider(),
        ),

      ],
      child: MyApp(),
    ));
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      home: Homepage(),
    );
  }
}