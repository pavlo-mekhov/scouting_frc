import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

        home: FirstRoute(),
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

class MyHomePage extends StatelessWidget { //frontend
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('A random Word:', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber)),
          Text(appState.current.asLowerCase, textAlign: TextAlign.center, style: TextStyle(color: Colors.amber)),



          Text('Autonomous Mode', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber)),

          ElevatedButton(onPressed: () {
            appState.getNext();
          }, child:
          Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(title: const Text('First Route')),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('A random Word:', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber)),
          Text(appState.current.asLowerCase, textAlign: TextAlign.center, style: TextStyle(color: Colors.amber)),



          Text('Autonomous Mode', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber)),

          ElevatedButton(onPressed: () {
            appState.getNext();
          }, child:
          Icon(Icons.favorite),
          ),
          ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            },
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('First Route')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Route')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}