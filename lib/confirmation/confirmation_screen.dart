import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final DateTime selectedDate;
  final List<String> selectedTimeSlots;

  ConfirmationScreen({
    required this.selectedDate,
    required this.selectedTimeSlots, required String name, required String phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Date :  ${selectedDate.toLocal()}'),
            SizedBox(height: 20),
            Text('Selected Time Slots :  ${selectedTimeSlots.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
