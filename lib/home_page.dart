import 'package:flutter/material.dart';
import 'package:scouting_frc/DataManagement/Objects/team_info.dart';
import 'package:scouting_frc/DataManagement/local_database.dart';
import 'package:scouting_frc/match_scouting_page.dart';
import 'package:scouting_frc/pit_scouting_page.dart';
import 'package:scouting_frc/teams_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team 6725 Scouting'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            _buildButton(
              label: 'Match Scouting',
              onPressed: () => _navigateTo(context, MatchScoutingPage()),
            ),
            const Spacer(),
            _buildButton(
              label: 'Team Data',
              onPressed: () => _navigateTo(context, TeamsPage()),
            ),
            const Spacer(),
            _buildButton(
              label: 'Analytics',
              onPressed: () => _navigateTo(context, PitScoutingPage()),
            ),
            const Spacer(),
            _buildButton(
              label: 'Add Team',
              onPressed: addTeamToDB,
              onLongPress: printTeams,
            ),
            const Spacer(flex: 50),
          ]
        )
      )
    );
  }

  Widget _buildButton({required String label, required VoidCallback onPressed, VoidCallback? onLongPress}) {
    return SizedBox(
      height: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          padding: EdgeInsets.zero,
        ),
        child: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void addTeamToDB() {
    TeamInfo team = TeamInfo(teamNumber: 11, teamName: 'Rev00');
    LocalDatabase.insertTeam(team);
  }

  void printTeams() {
    LocalDatabase.getAllTeamsAsString().then((teamsString) => print(teamsString));
  }
}