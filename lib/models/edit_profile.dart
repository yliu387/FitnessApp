import 'package:flutter/material.dart';
import '../models/user.dart';


class editProfile extends StatefulWidget {
  final Function(String, String, String) onSave;
  final user userInfo;

  const editProfile({Key? key, required this.onSave, required this.userInfo}) : super(key: key);

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController startingWeightController = TextEditingController();
  TextEditingController currentWeightController = TextEditingController();
  TextEditingController restingHeartRateController = TextEditingController();
  //TextEditingController stepsController = TextEditingController();

@override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Profile'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField('Starting Weight', startingWeightController),
            _buildTextField('Current Weight', currentWeightController),
            _buildTextField('Resting Heart Rate', restingHeartRateController),
           // _buildTextField('Steps', stepsController),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          onPressed: () {
            // Process the entered data
            String startingWeight = startingWeightController.text;
            String currentWeight = currentWeightController.text;
            String restingHeartRate = restingHeartRateController.text;
            //String steps = stepsController.text;

            widget.onSave(startingWeight, currentWeight, restingHeartRate);

            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        // keyboardType: TextInputType.number,
        // autofocus: false,
      ),
    );
  }
}