import 'package:flutter/material.dart';
import 'package:shahruh/settings_bottom_sheet.dart';
import 'package:shahruh/text_bottom_sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return const SettingsBottomSheet();
                  },
                );
              },
              child: const Text('Elevated Button'),
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const TextBottomSheet(
                          title: 'Long terms plans',
                          content:
                              '"Lorem Ipsum" is a common placeholder text used in the visual graphic design and publishing industries to demonstrate the look and feel of a layout, design, or typography. The phrase originates from a Latin text written by Cicero',
                          integrationText: [
                            {'Lorem Ipsum" is a common placeholder': "visual"},
                            {'Lorem Ipsum" is a common placeholder': "visual"},
                            {'Lorem Ipsum" is a common placeholder': "visual"}
                          ]);
                    },
                  );
                },
                icon: const Icon(Icons.info)),
            IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const TextBottomSheet(
                          title: 'Long terms plans',
                          content:
                              '"Lorem Ipsum" is a common placeholder text used in the visual graphic design and publishing industries to demonstrate the look and feel of a layout, design, or typography. The phrase originates from a Latin text written by Cicero',
                          integrationText: [
                            {'Lorem Ipsum" is a common placeholder': "visual"},
                            {'Lorem Ipsum" is a common placeholder': "visual"},
                            {'Lorem Ipsum" is a common placeholder': "visual"}
                          ]);
                    },
                  );
                },
                icon: const Icon(Icons.info)),
            IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const TextBottomSheet(
                          title: 'Long terms plans',
                          content:
                              '"Lorem Ipsum" is a common placeholder text used in the visual graphic design and publishing industries to demonstrate the look and feel of a layout, design, or typography. The phrase originates from a Latin text written by Cicero',
                          integrationText: [
                            {'Lorem Ipsum" is a common placeholder': "visual"},
                            {'Lorem Ipsum" is a common placeholder': "visual"},
                            {'Lorem Ipsum" is a common placeholder': "visual"}
                          ]);
                    },
                  );
                },
                icon: const Icon(Icons.info))
          ],
        ),
      ),
    );
  }
}
