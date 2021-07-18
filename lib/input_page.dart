import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomizer/main.dart';
import 'package:randomizer/random_page.dart';
import 'range_form.dart';

class InputPage extends ConsumerWidget {
  InputPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final ref

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Randomizer'),
        ),
        body: RangeForm(
          formKey: _formKey,
          minField: (value) {
            // randomize.
            ref.read(randomize).min = int.parse(value!);
          },
          maxField: (value) {
            ref.read(randomize).max = int.parse(value!);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              _formKey.currentState?.save();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RandomPage();
              }));
            }
          },
          child: Icon(Icons.forward),
        ),
      ),
    );
  }
}
