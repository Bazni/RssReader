import 'package:flutter/material.dart';
import 'package:rss_reader/widgets/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Home(title: 'RSS App'),
    );
  }
}