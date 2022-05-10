import 'package:flutter/material.dart';
import 'package:integration_project_flutter/conuter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: CounterView(),
    );
  }
}
