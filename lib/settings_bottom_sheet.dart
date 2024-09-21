import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'exercise_alert.dart';
import 'settings_provider.dart';
import 'time_bottom_sheet.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({super.key});

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    bool switchValue = false;
    return Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 400,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.grey.shade800,
          ),
          child: Column(
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Challenge reminders',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                value: switchValue,
                onChanged: (bool value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              settingsContainer(() {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return const ExerviseAlert();
                    });
              }, 'exercise', Provider.of<SettingsProvider>(context).exerciseName, true, Colors.white),
              const SizedBox(height: 20),
              settingsContainer(() {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return const TimeBottomSheet();
                  },
                );
              }, 'time', DateFormat('hh:mm a').format(settingsProvider.time),
                  false, Colors.blue),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign out",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
            ],
          ),
        );
      });
    });
  }

  InkWell settingsContainer(VoidCallback onTap, String text, String text1,
      bool iconShow, Color color) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade700),
        child: Row(
          children: [
            Text(
              "Challenge $text",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const Spacer(),
            Text(
              text1,
              style: TextStyle(fontSize: 16, color: color),
            ),
            iconShow
                ? const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
