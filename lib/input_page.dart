import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:randomizer/random_page.dart';
import 'range_form.dart';

class InputPage extends HookWidget {
  InputPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final _min = useState<int>(0);
    final _max = useState<int>(0);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Randomizer'),
        ),
        body: RangeForm(
          formKey: _formKey,
          minField: (value) {
            _min.value = int.parse(value!);
          },
          maxField: (value) {
            _max.value = int.parse(value!);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              _formKey.currentState?.save();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RandomPage(min: _min.value, max: _max.value);
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
