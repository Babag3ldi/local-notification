import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier{
  DateTime time = DateTime.now();
  int exerciseId = 0;
  String exerciseName= "";

  newDateTime(DateTime newDateTime){
    time = newDateTime;
    notifyListeners();
  }

  void selectExercise(ExerciseModel exerciseModel){ 
    exerciseId = exerciseModel.id;
    exerciseName = exerciseModel.name;
    notifyListeners();
  }
}

class ExerciseModel {
  final int id;
  final String name;

  ExerciseModel({
    required this.id,
    required this.name,
  });
}

List<ExerciseModel> exerciseList = [
  ExerciseModel(id: 0, name: "text 1"),
  ExerciseModel(id: 1, name: "text 2"),
  ExerciseModel(id: 2, name: "text 3"),
  ExerciseModel(id: 3, name: "text 4"),
  ExerciseModel(id: 4, name: "text 5"),
];