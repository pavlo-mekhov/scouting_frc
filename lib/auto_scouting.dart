
import 'package:flutter/material.dart';
import 'match_scouting_page.dart';

class AutoScoutingPage extends StatefulWidget {
  const AutoScoutingPage({super.key});

  @override
  State<AutoScoutingPage> createState() => _AutoScoutingPageState();
}

enum EndgameState { none, park, shallow, deep }

class _AutoScoutingPageState extends State<AutoScoutingPage> {


  final Map<String, int> counters = {
    "L1": 0, "L2": 0, "L3": 0, "L4": 0,
    "Removed": 0, "Barge": 0, "Processor": 0
  };

  EndgameState _endgame = EndgameState.none;
  Color parkColor = Colors.black;
  Color shallowColor = Colors.black;
  Color deepColor = Colors.black;

  void _updateCounter(String key, bool increment) {
    setState(() {
      counters[key] = (counters[key]! + (increment ? 1 : -1)).clamp(0, double.infinity).toInt();
    });
  }

  void _resetAll() {
    setState(() {
      counters.forEach((key, _) => counters[key] = 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double buttonHeight = MediaQuery.of(context).size.height * 0.07;
    double fontSize = MediaQuery.of(context).size.width * 0.045;

    return Scaffold(
      appBar: AppBar(title: const Text('Auto Scouting')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildNavigationButton("Match Scouting", const MatchScoutingPage(), fontSize),
            const SizedBox(height: 20),
            _buildCounterColumn("Auto Coral", ["L1", "L2", "L3", "L4"]),
            _buildCounterColumn("Auto Algae", ["Removed", "Processor", "Barge"]),
            const SizedBox(height: 20),
            _buildResetButton(fontSize),
          ],
        ),
      ),
    );
  }



  Widget _buildCounterColumn(String title, List<String> keys) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: keys.map((key) => Expanded(child: _buildCounterButton(key))).toList(),
        ),
      ],
    );
  }
  Widget _buildNavigationButton(String label, Widget page, double fontSize) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(label),
    );
  }
  Widget _buildCounterButton(String key) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onLongPress: () => _updateCounter(key, false),
        onPressed: () => _updateCounter(key, true),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        child: Text('$key: ${counters[key]}'),
      ),
    );
  }

  Widget _buildResetButton(double fontSize) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onLongPress: _resetAll,
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        child: const Text('Hold to Reset'),
      ),
    );
  }
}
