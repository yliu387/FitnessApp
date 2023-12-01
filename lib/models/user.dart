class user {
  final String name;
  final String username;
  //final String phoneNumber;
  double currentWeight;
  int restingHeartRate;
  double startingWeight;
  int steps;
   int strengthWorkoutsPerWeek;
   int cardioWorkoutsPerWeek;

  user({
    required this.username,
    required this.name,
    //required this.phoneNumber,
    required this.currentWeight,
    required this.restingHeartRate,
    required this.startingWeight,
    required this.steps,
    required this.strengthWorkoutsPerWeek,
    required this.cardioWorkoutsPerWeek,
  });
}
