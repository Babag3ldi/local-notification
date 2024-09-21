import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahruh/settings_provider.dart';

class TimeBottomSheet extends StatelessWidget {
  const TimeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 600,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.grey.shade800),
          child: Column(
            children: [
              const Text(
                "Challenge reminders",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text(
                "Set a reminder for a 60 seconds daily\nchallange?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(brightness: Brightness.dark),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: settingsProvider.time,
                    onDateTimeChanged: (newDateTime) {
                      setState(() => settingsProvider.time = newDateTime);
                    },
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    minimumSize: const Size(300, 45)),
                onPressed: () {
                  settingsProvider.newDateTime(settingsProvider.time);
                  Navigator.pop(context);
                },
                child: const Text('Elevated Button'),
              ),
              TextButton(
                  onPressed: () {
                    settingsProvider.time = DateTime.now();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
            ],
          ),
        );
      });
    });
  }
}
