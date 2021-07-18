import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/random_generator.dart';
import 'package:randomizer/random_page.dart';
import 'range_form.dart';

class InputPage extends StatelessWidget {
  InputPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Randomizer'),
        ),
        body: RangeForm(
          formKey: _formKey,
          minField: (value) {
            context.read<RandomizeChangeNotifier>().min = int.parse(value!);
          },
          maxField: (value) {
            context.read<RandomizeChangeNotifier>().max = int.parse(value!);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              _formKey.currentState?.save();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RandomPage();
              }));

              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return RandomPage(min: _min, max: _max);
              // }));
            }
          },
          child: Icon(Icons.forward),
        ),
      ),
    );
  }
}
