import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomPage extends HookWidget {
  final int _min;
  final int _max;

  RandomPage({
    Key? key,
    required min,
    required max,
  })  : _min = min,
        _max = max,
        super(key: key);

  // int? _randomNumber;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    final _randomNumber = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number'),
      ),
      body: Center(
        child: Text(
          _randomNumber.value?.toString() ?? 'Generate A Random Number',
          style: TextStyle(fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // setState(() {
          _randomNumber.value = _min + random.nextInt(_max + 1 - _min);
          // });
        },
        label: Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
