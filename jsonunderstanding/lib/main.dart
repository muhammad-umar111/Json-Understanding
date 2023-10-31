import 'package:flutter/material.dart';
import 'package:jsonunderstanding/CountriesPage.dart';
import 'package:jsonunderstanding/PhotoPage.dart';
import 'package:jsonunderstanding/homepage.dart';
import 'package:jsonunderstanding/UsersPage.dart';

import 'UsersWithoutModelPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CountriesPage(title: 'Countries Page'),
    );
  }
}

