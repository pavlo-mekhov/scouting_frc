import 'package:flutter/material.dart';

class TeamDetailsPage extends StatelessWidget {
  final Map<String, dynamic> teamData;

  const TeamDetailsPage({super.key, required this.teamData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Team ${teamData['team_number']} Details')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Team Name: ${teamData['name']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Rating: ${teamData['rating']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Drivetrain: ${teamData['drivetrain']}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}