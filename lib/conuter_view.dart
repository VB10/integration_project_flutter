import 'package:flutter/material.dart';
import 'package:integration_project_flutter/page_objects/counter_objects.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _counter = 0;
  final TextEditingController _textEditingController = TextEditingController();
  void _updateCounter() {
    setState(() {
      ++_counter;
    });
  }

  void _updateCounterValue(int value) {
    setState(() {
      _counter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(tooltip: CounterObjects.buttonTooltip, onPressed: _updateCounter),
      body: Column(
        children: [
          Text('Result: $_counter', style: Theme.of(context).textTheme.headline2),
          TextField(
            key: CounterObjects.textFieldKey,
            keyboardType: TextInputType.number,
            controller: _textEditingController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          Semantics(
            button: true,
            label: CounterObjects.buttonCalculate,
            child: TextButton(
                onPressed: () {
                  _updateCounterValue(int.tryParse(_textEditingController.text) ?? 0);
                },
                child: const Text("Calculate")),
          )
        ],
      ),
    );
  }
}
