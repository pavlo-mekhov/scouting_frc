class TeamInfo {
  final int teamNumber;
  String teamName = '';
  int drivetrainType = -1; //0-tank, 1-Swerve, 2-other
  int weight = -1;


  TeamInfo({required this.teamNumber, String? teamName}) {
    if (teamName!.isNotEmpty) {
      this.teamName = teamName;
    }
  }

  Map<String, Object?> toMap() {
    return {'team_number': teamNumber, 'name': teamName, 'drivetrain': drivetrainType};
  }

  String getDrivetrain() {
    switch (drivetrainType){
      case 0:
        return 'Tank';
      case 1:
        return 'Swerve';
      case 2:
        return 'Other';
      default:
        return 'Unknown';
    }
  }

  @override
  String toString() {
    return 'Team{$teamNumber, name: $teamName, $getDrivetrain}';
  }
}