import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/random_generator.dart';

class RandomPage extends StatelessWidget {
  RandomPage({
    Key? key,
  }) : super(key: key);

  // int? _randomNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number'),
      ),
      body: Center(
        child: Text(
          context.watch<RandomizeChangeNotifier>().randomNumber?.toString() ??
              'Generate A Random Number',
          style: TextStyle(fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // setState(() {
          context.read<RandomizeChangeNotifier>().generateRandomNumber();
          // });
        },
        label: Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
