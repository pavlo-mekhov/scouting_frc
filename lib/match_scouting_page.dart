import 'package:flutter/material.dart';
import 'auto_scouting.dart';

class MatchScoutingPage extends StatefulWidget {
  const MatchScoutingPage({super.key});

  @override
  State<MatchScoutingPage> createState() => _MatchScoutingPageState();
}

enum EndgameState { none, park, shallow, deep }

class _MatchScoutingPageState extends State<MatchScoutingPage> {
  int teamNumber = 0;
  int matchNumber = 0;

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

  void _setEndgame(EndgameState state) {
    setState(() {
      _endgame = state;
      parkColor = state == EndgameState.park ? Colors.green : Colors.black;
      shallowColor = state == EndgameState.shallow ? Colors.green : Colors.black;
      deepColor = state == EndgameState.deep ? Colors.green : Colors.black;
    });
  }

  void _resetAll() {
    setState(() {
      counters.forEach((key, _) => counters[key] = 0);
      _endgame = EndgameState.none;
      parkColor = shallowColor = deepColor = Colors.black;
    });
  }

  @override

  Widget build(BuildContext context) {
    double buttonHeight = MediaQuery.of(context).size.height * 0.07;
    double fontSize = MediaQuery.of(context).size.width * 0.045;

    return Scaffold(
      appBar: AppBar(title: const Text('Match Scouting')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _buildTextField("Team:" "$teamNumber", (value) {
              setState(() { teamNumber = int.tryParse(value) ?? 0; });
            }),
            _buildTextField("Match:" "$matchNumber", (value) {
              setState(() { matchNumber = int.tryParse(value) ?? 0; });
            }),
            const SizedBox(height: 20),

            // 🔹 Moved Auto button **below text fields** but **above the other buttons**
            _buildNavigationButton("Auto", const AutoScoutingPage(), fontSize),
            const SizedBox(height: 20),

            _buildCounterColumn("Coral", ["L1", "L2", "L3", "L4"]),
            _buildCounterColumn("Algae", ["Removed", "Processor", "Barge"]),
            const SizedBox(height: 20),

            _buildEndgameButtons(buttonHeight, fontSize),
            const SizedBox(height: 20),

            Align(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        keyboardType: TextInputType.number,
        onChanged: onChanged,
      ),
    );
  }
  Widget _buildEndgameButton(String label, EndgameState state, Color bgColor, double buttonHeight, double fontSize) {
    return SizedBox(
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () => _setEndgame(state),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        child: Text(label),
      ),
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

  Widget _buildCounterColumn(String title, List<String> keys) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: keys.map((key) =>
              Expanded(child: _buildCounterButton(key))
          ).toList(),
        ),
      ],
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

  Widget _buildEndgameButtons(double buttonHeight, double fontSize) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text("Endgame", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: _buildEndgameButton("Shallow", EndgameState.shallow, shallowColor, buttonHeight, fontSize)),
            Expanded(child: _buildEndgameButton("Deep", EndgameState.deep, deepColor, buttonHeight, fontSize)),
            Expanded(child: _buildEndgameButton("Park", EndgameState.park, parkColor, buttonHeight, fontSize)),
          ],
        ),
      ],
    );
  }
}
