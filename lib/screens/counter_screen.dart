import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    setState(() {
      counter++;
    });
  }

  void decrease() {
    setState(() {
      counter--;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CounterScreen')),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Numero de clicks:",
              style: fontSize30,
            ),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingAction(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}

class CustomFloatingAction extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;
  const CustomFloatingAction({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1),
          onPressed: () => increaseFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.restart_alt_rounded),
          onPressed: () => resetFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () => decreaseFn(),
        ),
      ],
    );
  }
}
