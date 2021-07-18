import 'package:flutter/material.dart';

typedef CallBack = void Function(String?);

class RangeForm extends StatelessWidget {
  const RangeForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    this.maxField,
    this.minField,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final CallBack? maxField;
  final CallBack? minField;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IntegerField(
              label: 'Minimum',
              onSaved: minField
            ),
            IntegerField(
              label: 'Maximum',
              onSaved: maxField,
            ),
          ],
        ),
      ),
    );
  }
}

class IntegerField extends StatelessWidget {
  const IntegerField({
    Key? key,
    this.label = '',
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      keyboardType: TextInputType.number,
      onSaved: onSaved,
      validator: (value) {
        var p = int.tryParse(value ?? 'zd');
        if (p == null) {
          return 'Please enter a number';
        }
        return null;
      },
    );
  }
}
