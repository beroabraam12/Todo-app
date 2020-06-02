import 'package:flutter/material.dart';

class TodoModel {
  final String id, image, name, desc;
  final DateTime date;
  final TimeOfDay time;
  final Color color;
  bool done;

  TodoModel({
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.desc,
    @required this.date,
    @required this.time,
    @required this.color,
    done = false,
  });
}
