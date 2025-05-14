import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scouting_frc/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { //window builder?
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Scouting App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), 
          scaffoldBackgroundColor: Colors.blueGrey
        ),

        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier { //main class with methods and variables
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}




class _CounterState extends State<Counter> {

  int _counterL1 = 0;
  int _counterL2 = 0;
  int _counterL3 = 0;
  int _counterL4 = 0;
  void _incrementL1() {
    setState(() {
      _counterL1++;
    });
  }
  void _deincrementL1() {
    setState(() {
      _counterL1--;
    });
  }
  void _incrementL2() {
    setState(() {
      _counterL2++;
    });
  }
  void _deincrementL2() {
    setState(() {
      _counterL2--;
    });
  }
  void _incrementL3() {
    setState(() {
      _counterL3++;
    });
  }
  void _deincrementL3() {
    setState(() {
      _counterL3--;
    });
  }void _incrementL4() {
    setState(() {
      _counterL4++;
    });
  }
  void _deincrementL4() {
    setState(() {
      _counterL4--;
    });
  }

  @override
  Widget build(BuildContext context) {

    padding: const EdgeInsets.symmetric(vertical: 100);
    return Scaffold(
      appBar: AppBar(title: const Text('Second Route')),
      body: Column(
        children: <Widget>[
          ElevatedButton(onLongPress: _deincrementL1, onPressed: _incrementL1, child: const Text('L1 score')),
          ElevatedButton(onLongPress: _deincrementL2, onPressed: _incrementL2, child: const Text('L2 score')),
          ElevatedButton(onLongPress: _deincrementL3, onPressed: _incrementL3, child: const Text('L3 score')),
          ElevatedButton(onLongPress: _deincrementL4, onPressed: _incrementL4, child: const Text('L4 score')),
          const SizedBox(width: 50),
          Text('L1 Count: $_counterL1'),
          const SizedBox(width: 50),
          Text('L2 Count: $_counterL2'),
          const SizedBox(width: 50),
          Text('L3 Count: $_counterL3'),
          const SizedBox(width: 50),
          Text('L4 Count: $_counterL4'),
      ],
      ),
    );
  }
}
class Counter extends StatefulWidget {
  // This class is the configuration for the state.
  // It holds the values (in this case nothing) provided
  // by the parent and used by the build  method of the
  // State. Fields in a Widget subclass are always marked
  // "final".

  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}