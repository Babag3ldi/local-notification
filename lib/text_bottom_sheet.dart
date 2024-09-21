import 'package:flutter/material.dart';

class TextBottomSheet extends StatelessWidget {
  const TextBottomSheet(
      {super.key,
      required this.title,
      required this.content,
      required this.integrationText});

  final String title;
  final String content;
  final List<Map<String, dynamic>> integrationText;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        height: 600,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.grey.shade800,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Integration time",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
             ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: integrationText.length,
              itemBuilder: (context, index){
              return  Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${integrationText[index].keys.first}: ",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextSpan(
                      text: integrationText[index].values.first,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ],
                ),
              );
             })
            ],
          ),
        ),
      );
    });
  }
}
