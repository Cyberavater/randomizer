
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomizer/input_page.dart';
import 'package:randomizer/random_generator.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

final randomize = StateNotifierProvider<RandomizerNotifier, RandomizerState>((_) => RandomizerNotifier());

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
