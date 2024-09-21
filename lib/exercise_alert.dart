import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'settings_provider.dart';

class ExerviseAlert extends StatefulWidget {
  const ExerviseAlert({super.key});

  @override
  State<ExerviseAlert> createState() => _ExerviseAlertState();
}

class _ExerviseAlertState extends State<ExerviseAlert> {
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height / 100;
    double sizeWidth = MediaQuery.of(context).size.width / 100;
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) {
        return Dialog(
          child: Container(
            height: sizeHeight * 45,
            width: sizeWidth * 95,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const Text(
                  "Select exercise",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: sizeHeight * 2),
                Expanded(
                    child: ListView.builder(
                        itemCount: exerciseList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              settingsProvider
                                  .selectExercise(exerciseList[index]);
                              Navigator.pop(context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  exerciseList[index].name,
                                  style: const TextStyle(color: Colors.white),
                                )),
                          );
                        }))
              ],
            ),
          ),
        );
      });
    });
  }
}
