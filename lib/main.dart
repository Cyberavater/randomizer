// import 'dart:ffi';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/input_page.dart';
import 'package:randomizer/random_generator.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RandomizeChangeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputPage(),
    );
  }
}
