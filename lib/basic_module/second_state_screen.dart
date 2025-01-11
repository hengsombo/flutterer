import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_logic.dart';

class SecondStateScreen extends StatefulWidget {

  @override
  State<SecondStateScreen> createState() => _SecondStateScreenState();
}

class _SecondStateScreenState extends State<SecondStateScreen> {
  // int counter = 0;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {

    _counter = context.watch<CounterLogic>().counter;

    return Scaffold(
      appBar: AppBar(
        title: Text("Second State Screen"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterLogic>().decrease();
              debugPrint("counter: $_counter");
            },
            icon: Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              context.read<CounterLogic>().increase();
              debugPrint("counter: $_counter");
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Hello Cambodia"
          // "counter: $_counter",
          // style: TextStyle(fontSize: 25),
        )
      ),
    );
  }
}
