import 'package:flutter/material.dart';
import 'package:state_management_basics_1/randomizer_page.dart';
import 'package:state_management_basics_1/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  // const RangeSelectorPage({super.key, required this.title});
  const RangeSelectorPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  // ignore: unused_field
  int _min = 0;
  // ignore: unused_field
  int _max = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: ((value) => _min = value),
        maxValueSetter: ((value) => _max = value),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (constext) => RandomizerPage(
                  min: _min,
                  max: _max,
                ),
              ),
            );
          }
          // TODO: Navigate to the generated page
        },
      ),
    );
  }
}
