import 'package:flutter/material.dart';

class PitScoutingPage extends StatefulWidget {
  const PitScoutingPage({super.key});

  @override
  State<PitScoutingPage> createState() => _PitScoutingPageState();
}

enum EndgameState { none, park, shallow, deep }
enum DriveTrainState { none, tank, swerve, other }
enum PreferredAutoState { none, left, right, center }

class _PitScoutingPageState extends State<PitScoutingPage> {
  int teamNumber = 0000;
  int matchNumber = 0;
  int coralPerGame = 0;
  int algaePerGame = 0;


  EndgameState _endgame = EndgameState.none;
  DriveTrainState _driveTrain = DriveTrainState.none;
  PreferredAutoState _preferredAuto = PreferredAutoState.none;

  Color parkColor = Colors.black;
  Color shallowColor = Colors.black;
  Color deepColor = Colors.black;
  Color tankColor = Colors.black;
  Color swerveColor = Colors.black;
  Color otherColor = Colors.black;
  Color leftColor = Colors.black;
  Color rightColor = Colors.black;
  Color centerColor = Colors.black;

  void _setEndgame(EndgameState state) {
    setState(() {
      _endgame = state;
      parkColor = state == EndgameState.park ? Colors.green : Colors.black;
      shallowColor = state == EndgameState.shallow ? Colors.green : Colors.black;
      deepColor = state == EndgameState.deep ? Colors.green : Colors.black;
    });
  }

  void _setDriveTrain(DriveTrainState state) {
    setState(() {
      _driveTrain = state;
      tankColor = state == DriveTrainState.tank ? Colors.green : Colors.black;
      swerveColor = state == DriveTrainState.swerve ? Colors.green : Colors.black;
      otherColor = state == DriveTrainState.other ? Colors.green : Colors.black;
    });
  }

  void _setPreferredAuto(PreferredAutoState state) {
    setState(() {
      _preferredAuto = state;
      leftColor = state == PreferredAutoState.left ? Colors.green : Colors.black;
      centerColor = state == PreferredAutoState.center ? Colors.green : Colors.black;
      rightColor = state == PreferredAutoState.right ? Colors.green : Colors.black;
    });
  }

  void _resetAll() {
    setState(() {
      teamNumber = 0000;
      matchNumber = 0;
      coralPerGame = 0;
      algaePerGame = 0;
      _endgame = EndgameState.none;
      _driveTrain = DriveTrainState.none;
      _preferredAuto = PreferredAutoState.none;
      parkColor = shallowColor = deepColor = Colors.black;
      tankColor = swerveColor = otherColor = Colors.black;
      leftColor = centerColor = rightColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    double buttonHeight = MediaQuery.of(context).size.height * 0.07;
    double fontSize = MediaQuery.of(context).size.width * 0.045;

    return Scaffold(
      appBar: AppBar(title: const Text('Pit Scouting')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _buildTextField("Team #", (value) {
              setState(() { teamNumber = int.tryParse(value) ?? 0; });
            }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(child: _buildTextField("Coral Per Game", (value) {
                    setState(() { coralPerGame = int.tryParse(value) ?? 0; });
                  })),
                  const SizedBox(width: 10),
                  Expanded(child: _buildTextField("Algae Per Game", (value) {
                    setState(() { algaePerGame = int.tryParse(value) ?? 0; });
                  })),
                ],
              ),
            ),

            _buildEndgameButtons(buttonHeight, fontSize),
            _buildDriveTrainButtons(buttonHeight, fontSize),
            const SizedBox(height: 20),

            ElevatedButton(
              onLongPress: _resetAll,
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
              child: const Text('Hold to Reset'),
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
            _buildEndgameButton("Shallow", EndgameState.shallow, shallowColor, buttonHeight, fontSize),
            _buildEndgameButton("Deep", EndgameState.deep, deepColor, buttonHeight, fontSize),
            _buildEndgameButton("Park", EndgameState.park, parkColor, buttonHeight, fontSize),
          ],
        ),
      ],
    );
  }

  Widget _buildEndgameButton(String label, EndgameState state, Color bgColor, double buttonHeight, double fontSize) {
    return SizedBox(
      height: 50,
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

  Widget _buildDriveTrainButtons(double buttonHeight, double fontSize) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text("Drive Train", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDriveTrainButton("Tank", DriveTrainState.tank, tankColor, buttonHeight, fontSize),
            _buildDriveTrainButton("Swerve", DriveTrainState.swerve, swerveColor, buttonHeight, fontSize),
            _buildDriveTrainButton("Other", DriveTrainState.other, otherColor, buttonHeight, fontSize),
          ],
        ),
      ],
    );
  }

  Widget _buildDriveTrainButton(String label, DriveTrainState state, Color bgColor, double buttonHeight, double fontSize) {
    return SizedBox(
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () => _setDriveTrain(state),
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
}
