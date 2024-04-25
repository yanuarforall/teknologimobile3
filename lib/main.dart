import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider( 
    create: (context) => Counter(),
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample',
      home: CounterApp(),
    );
  }
}

class Counter with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void increment() {
    _number++;
    notifyListeners();
  }

  void decrement() {
    _number--;
    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Code jarene'),
      ),
      body: Center(
        child: 
        Text('Kamu harus tekan tombol ${context.watch<Counter>().number} kali.')
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
