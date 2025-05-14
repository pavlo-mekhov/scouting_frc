class TeamInfo {
  int teamNumber = 0;
  String teamName = '';
  int drivetrainType = -1; //0-tank, 1-Swerve, 2-other
  int weight = -1;

  // TeamInfo(this.teamNumber, this.teamName);


  TeamInfo(int number, String name) {
    teamName = name;
    teamNumber = number;
  }
}