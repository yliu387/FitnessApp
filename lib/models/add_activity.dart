import 'package:flutter/material.dart';
import '../models/user.dart';

class Add_Activity extends StatefulWidget {
  final Function(int, int, int) onSave;
  final user userInfo;

  const Add_Activity({Key? key, required this.onSave, required this.userInfo}) : super(key: key);

  @override
  _Add_ActivityState createState() => _Add_ActivityState();
}

class _Add_ActivityState extends State<Add_Activity> {
  TextEditingController stepsController = TextEditingController();
  TextEditingController cardioWorkoutController = TextEditingController();
  TextEditingController strengthWorkoutController = TextEditingController();
  //TextEditingController stepsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Workout'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField('Steps', stepsController),
            _buildTextField('Cardio Workout', cardioWorkoutController),
            _buildTextField('Strength Workout', strengthWorkoutController),
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
              int steps = int.parse(stepsController.text);
              int cardio = int.parse(cardioWorkoutController.text);
              int strength = int.parse(strengthWorkoutController.text);

              widget.onSave(steps, cardio, strength);

              stepsController.clear();
              cardioWorkoutController.clear();
              strengthWorkoutController.clear();

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
