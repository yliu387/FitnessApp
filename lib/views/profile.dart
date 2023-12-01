import 'package:battleships/models/add_activity.dart';
import 'package:flutter/material.dart';
import 'package:battleships/models/user.dart';
import 'package:battleships/resources/resources.dart';
import 'package:battleships/Calender/main.dart';
import 'package:battleships/models/edit_profile.dart';
import 'login_screen.dart';
import '../utils/session_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}


void _editPrfileDialog(
    BuildContext context, Function(String, String, String) onSave, user userInfo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return editProfile(
        onSave: onSave,
        userInfo: userInfo,
      );
    },
  );
}

void _addWorkoutDialog(
    BuildContext context, Function(int, int, int) add, user userInfo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Add_Activity(
        onSave: add,
        userInfo: userInfo,
      );
    },
  );
}


Widget buildRow(List<String> categories, List<int> values) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(
      categories.length,
      (index) => Column(
        children: [
          Text(
            values[index].toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            categories[index],
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );
}

class _ProfileState extends State<Profile> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  void addWorkout(int steps, int cardioWorkout, int strengthWorkout) {
    setState(() {
      userInfo.steps += steps;
      userInfo.cardioWorkoutsPerWeek += cardioWorkout;
      userInfo.strengthWorkoutsPerWeek += strengthWorkout;
    });
  }

  void updateUserInfo(String startingWeight, String currentWeight, String restingHeartRate) {
    // Update the user information here
    setState(() {
      userInfo.startingWeight = double.parse(startingWeight);
      userInfo.currentWeight = double.parse(currentWeight);
      userInfo.restingHeartRate = int.parse(restingHeartRate);
      //userInfo.steps = int.parse(steps);
    });
  }
    String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
    super.initState();
    values1 = [userInfo.startingWeight.toInt(), userInfo.currentWeight.toInt()];
    values2 = [userInfo.restingHeartRate, userInfo.steps];
    values3 = [userInfo.strengthWorkoutsPerWeek, userInfo.cardioWorkoutsPerWeek];
  }

  Future<void> _loadUsername() async {
    username = await SessionManager.getUsername();
    setState(() {}); // Update the UI with the fetched username
  }  
  
  Future<void> _logout(BuildContext context) async {
    await SessionManager.clearSession();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  user userInfo = user(
    name: 'Student Name',
    username: 'student1_username',
    //phoneNumber: '123-456-7890',
    currentWeight: 150,
    restingHeartRate: 80,
    startingWeight: 155,
    steps: 1000,
    strengthWorkoutsPerWeek: 1,
    cardioWorkoutsPerWeek: 2,
  );

  List<String> categories1 = ['Starting Weight', 'Current Weight'];
  List<String> categories2 = ['Resting Heart Rate', 'Steps'];
  List<String> categories3 = ['Strength Workouts', 'Cardio Workouts'];
  List<int> values1 = [];
  List<int> values2 = [];
  List<int> values3 = [];


  void _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
      
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        appBar: currentPageIndex == 0
            ? AppBar(
                centerTitle: true,
                title: Text('Profile'),
                backgroundColor: Colors.red,
                actions: [
                    IconButton(
                      onPressed: () {
                        _addWorkoutDialog(context, addWorkout, userInfo);
                      },
                      icon: const Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        _editPrfileDialog(context, updateUserInfo, userInfo);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () => _logout(context),
                    ),
                  ])
            : null,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          currentIndex: currentPageIndex,
          fixedColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_sharp),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Resources',
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // Profile Page
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/profile_pic_icon.jpeg',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    userInfo.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    color: const Color.fromARGB(50, 100, 100, 100),
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              color: Colors.red[500],
                            ),
                            Text(
                              userInfo.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    color: const Color.fromARGB(50, 100, 105, 105),
                    child: Column(
                      children: [
                        buildRow(categories1, values1),
                        const Padding(padding: EdgeInsets.all(6)),
                        buildRow(categories2, values2),
                        const Padding(padding: EdgeInsets.all(6)),
                        buildRow(categories3, values3),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  const Text('Weekly Progress:'),
                  const SizedBox(height: 30),
                  Transform.scale(
                    scale: 0.8,
                    child: const LinearProgressIndicator(
                      value: 0.5,
                      semanticsLabel: 'Linear progress indicator',
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            calendarPage(),

            // Resources Page
            ResourcesPage(),
            
          ],
        ),
      ),
    );
  }
}
