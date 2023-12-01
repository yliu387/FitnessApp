// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// // void main() {
// //   runApp(const ResourcesPage());
// // }

// class ResourcesPage extends StatelessWidget {
//   const ResourcesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Resources',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Resources'),
//         ),
//         body: const ResourceList(),
//       ),
//     );
//   }
// }

// class ResourceList extends StatelessWidget {
//   const ResourceList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         ListTile(
//           title: const Text('Athletic Department Office Website',
//               textAlign: TextAlign.center),
//           onTap: () {
//             launch('https://illinoistechathletics.com/');
//             // Open the athletic department's website (replace with actual URL).
//             // You can use the launch URL package to open URLs.
//           },
//         ),
//         ListTile(
//           title: const Text('Club Registration Guide',
//               textAlign: TextAlign.center),
//           onTap: () {
//             // Navigate to the club registration guide page (you'll need to create this page).
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const ClubRegistrationGuide()));
//           },
//         ),
//         const SportGrid(),
//       ],
//     );
//   }
// }

// class SportGrid extends StatelessWidget {
//   const SportGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final sports = [
//       'Esport',
//       'Sand Volleyball',
//       'Badminton',
//       'Bowling',
//       'Cricket',
//       'Outdoor Soccer',
//       'Volleyball',
//     ];

//     return Column(
//       children: List.generate((sports.length / 2).ceil(), (rowIndex) {
//         int startIndex = rowIndex * 2;
//         int endIndex =
//             (startIndex + 2) > sports.length ? sports.length : (startIndex + 2);

//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: sports.sublist(startIndex, endIndex).map((sport) {
//             int index = sports.indexOf(sport);
//             return Padding(
//               padding: const EdgeInsets.all(10.0), // Add spacing here
//               child: Column(
//                 children: [
//                   Card(
//                     color: Colors.red,
//                     child: Image.asset('images/sport${index + 1}.png',
//                         height: 100, width: 100),
//                     // Load your sport images here
//                   ),
//                   Text(sport),
//                 ],
//               ),
//             );
//           }).toList(),
//         );
//       }),
//     );
//   }
// }

// class ClubRegistrationGuide extends StatelessWidget {
//   const ClubRegistrationGuide({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Club Registration Guide'),
//       ),
//       body: ListView(
//         children: const <Widget>[
//           ListTile(
//             title: Text('Step 1: Find a Club'),
//             subtitle: Text('Search for clubs that interest you.'),
//           ),
//           ListTile(
//             title: Text('Step 2: View Club Details'),
//             subtitle:
//                 Text('Learn more about the club\'s mission and activities.'),
//           ),
//           ListTile(
//             title: Text('Step 3: Register for the Club'),
//             subtitle:
//                 Text('Click the "Register" button to express your interest.'),
//           ),
//           ListTile(
//             title: Text('Step 4: Approval Process'),
//             subtitle:
//                 Text('Wait for club administrators to approve your request.'),
//           ),
//           ListTile(
//             title: Text('Step 5: Get Involved'),
//             subtitle: Text('Start participating in club activities.'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ResourcesPage());
}

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resources',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Resources'),
        ),
        body: const ResourceList(),
      ),
    );
  }
}

class ResourceList extends StatelessWidget {
  const ResourceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: <Widget>[
        ListTile(
          title: const Text(
            'Athletic Department Website',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            launch('https://illinoistechathletics.com/');
          },
        ),
        ListTile(
          title: const Text(
            'Club Registration Guide',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ClubRegistrationGuide(),
              ),
            );
          },
        ),
        const SportGrid(),
      ],
    );
  }
}

class SportGrid extends StatelessWidget {
  const SportGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sports = [
      'Esport',
      'Sand Volleyball',
      'Badminton',
      'Bowling',
      'Cricket',
      'Outdoor Soccer',
      'Volleyball',
    ];

    return Column(
      children: List.generate(
        (sports.length / 2).ceil(),
        (rowIndex) {
          int startIndex = rowIndex * 2;
          int endIndex = (startIndex + 2) > sports.length
              ? sports.length
              : (startIndex + 2);

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sports
                .sublist(startIndex, endIndex)
                .map((sport) {
                  int index = sports.indexOf(sport);
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.red,
                          child: Image.asset('assets/images/sport${index + 1}.png',
                            height: 100, width: 100),
                        ),
                        Text(sport),
                      ],
                    ),
                  );
                })
                .toList(),
          );
        },
      ),
    );
  }
}

class ClubRegistrationGuide extends StatelessWidget {
  const ClubRegistrationGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Registration Guide'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Step 1: Find a Club'),
            subtitle: Text('Search for clubs that interest you.'),
          ),
          ListTile(
            title: Text('Step 2: View Club Details'),
            subtitle: Text(
                'Learn more about the club\'s mission and activities.'),
          ),
          ListTile(
            title: Text('Step 3: Register for the Club'),
            subtitle:
                Text('Click the "Register" button to express your interest.'),
          ),
          ListTile(
            title: Text('Step 4: Approval Process'),
            subtitle:
                Text('Wait for club administrators to approve your request.'),
          ),
          ListTile(
            title: Text('Step 5: Get Involved'),
            subtitle: Text('Start participating in club activities.'),
          ),
        ],
      ),
    );
  }
}

