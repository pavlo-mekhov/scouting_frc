import 'package:flutter/material.dart';

class _CounterState extends State<Counter> {
  Color selection = Colors.orange[400]!;
  int _counterL1 = 0;
  int _counterL2 = 0;
  int _counterL3 = 0;
  int _counterL4 = 0;
  int _counterRemoved = 0;
  int _counterBarge = 0;
  int _counterProcessor = 0;

  int _endgame = 0;//none = 0, park = 1, shallow = 2, deep = 3

  Color parkColor = Colors.black;
  Color shallowColor = Colors.black;
  Color deepColor = Colors.black;
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
  void _incrementRemoved() {
    setState(() {
      _counterRemoved++;
    });
  }
  void _deincrementRemoved() {
    setState(() {
      _counterRemoved--;
    });
  }
  void _incrementBarge() {
    setState(() {
      _counterBarge++;
    });
  }
  void _deincrementBarge() {
    setState(() {
      _counterBarge--;
    });
  }
  void _incrementProcessor() {
    setState(() {
      _counterProcessor++;
    });
  }
  void _deincrementProcessor() {
    setState(() {
      _counterProcessor--;

    });
  }
  void _endgameClear() {
    setState(() {
      _endgame = 0;
      parkColor = Colors.black;
      shallowColor = Colors.black;
      deepColor = Colors.black;
    });
  }
  void _endgameDeep() {
    setState(() {
      _endgame = 3;
      parkColor = Colors.black;
      shallowColor = Colors.black;
      deepColor = Colors.green;
    });
  }
  void _endgameShallow() {
    setState(() {
      _endgame = 3;
      parkColor = Colors.black;
      shallowColor = Colors.green;
      deepColor = Colors.black;
    });
  }
  void _endgamePark() {
    setState(() {
      _endgame = 1;
      parkColor = Colors.green;
      shallowColor = Colors.black;
      deepColor = Colors.black;
    });
  }
  void _resetAll() {
    setState(() {
      _counterL1 = 0;
      _counterL2 = 0;
      _counterL3 = 0;
      _counterL4 = 0;
      _counterRemoved = 0;
      _counterBarge = 0;
      _counterProcessor = 0;
      parkColor = Colors.black;
      shallowColor = Colors.black;
      deepColor = Colors.black;
    });
  }
  void _none() {

  }
  // 4x coral counters

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('Match Scouting'),),

      body: ListView(
        children:[ Row(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Text('Coral',style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ElevatedButton(onLongPress: _deincrementL1, onPressed: _incrementL1, child: Text('L1: $_counterL1'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),

                    const SizedBox(width: 50,),
                    ElevatedButton(onLongPress: _deincrementL2, onPressed: _incrementL2, child: Text('L2: $_counterL2'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),//TextStyle gives details like color + size ),

                    const SizedBox(width: 50),
                    ElevatedButton(onLongPress: _deincrementL3, onPressed: _incrementL3, child: Text('L3: $_counterL3'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),//TextStyle gives details like color + size ),
                    ElevatedButton(onLongPress: _deincrementL4, onPressed: _incrementL4, child: Text('L4: $_counterL4'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),
                    Text('Coral',style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                    ElevatedButton(onLongPress: _deincrementL1, onPressed: _incrementL1, child: Text('L1: $_counterL1'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),

                    const SizedBox(width: 50,),
                    ElevatedButton(onLongPress: _deincrementL2, onPressed: _incrementL2, child: Text('L2: $_counterL2'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),//TextStyle gives details like color + size ),

                    const SizedBox(width: 50),
                    ElevatedButton(onLongPress: _deincrementL3, onPressed: _incrementL3, child: Text('L3: $_counterL3'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),//TextStyle gives details like color + size ),
                    ElevatedButton(onLongPress: _deincrementL4, onPressed: _incrementL4, child: Text('L4: $_counterL4'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),//TextStyle gives details like color + size ),

                  ])

              ,Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Algae", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ElevatedButton(onLongPress: _deincrementRemoved, onPressed: _incrementRemoved, child: Text('Removed: $_counterRemoved'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),
                    ElevatedButton(onLongPress: _deincrementProcessor, onPressed: _incrementProcessor, child: Text('Processor: $_counterProcessor'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),//T//TextStyle gives details like color + size ),
                    ElevatedButton(onLongPress: _deincrementBarge, onPressed: _incrementBarge, child: Text('Barge: $_counterBarge'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),),
                    Column(//endgame
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,



                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Endgame", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ElevatedButton(onLongPress: _endgameClear,
                            onPressed: _endgameShallow,
                            child: Text('Shallow'),
                            style: ElevatedButton.styleFrom(

                                backgroundColor: shallowColor,
                                foregroundColor: Colors.amber,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),),
                          ElevatedButton(onLongPress: _endgameClear,
                            onPressed: _endgameDeep,
                            child: Text('Deep'),
                            style: ElevatedButton.styleFrom(

                                backgroundColor: deepColor,
                                foregroundColor: Colors.amber,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),),
                          ElevatedButton(onLongPress: _endgameClear,
                            onPressed: _endgamePark,
                            child: Text('Park'),
                            style: ElevatedButton.styleFrom(

                                backgroundColor: parkColor,
                                foregroundColor: Colors.amber,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(onLongPress: _resetAll, onPressed: _none, child: const Text('Hold to Reset'),
                              style: ElevatedButton.styleFrom(

                                  backgroundColor: Colors.amber,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),),
                          ),

                        ])
                  ])]),
      ],
    ));       //TextStyle gives details like color + size ),Reset button



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