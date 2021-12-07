import 'package:flutter/material.dart';
import 'package:json_api/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'JSON API'),
    );
  }
}
