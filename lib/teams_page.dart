import 'package:flutter/material.dart';
import 'package:scouting_frc/DataManagement/Objects/team_info.dart';
import 'package:scouting_frc/DataManagement/local_database.dart';
import 'team_details_page.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  List<Map<String, dynamic>> teams = [];

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  Future<void> _loadTeams() async {
    final fetchedTeams = await LocalDatabase.getAllTeams();
    setState(() {
      teams = fetchedTeams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Rankings')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildHeaderRow(),
            Expanded(child: _buildTeamList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('Team Number', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Rating', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTeamList() {
    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];
        return ListTile(
          title: Text('${team['team_number']} - ${team['name']}'),
          subtitle: Text('Rating: ${team['rating']}'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => _navigateToDetails(context, team),
        );
      },
    );
  }

  void _navigateToDetails(BuildContext context, Map<String, dynamic> team) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeamDetailsPage(teamData: team),
      ),
    );
  }
}