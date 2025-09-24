import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Note {
  String title = "";
  String content = "";

  Note({required this.title, required this.content});
}

class NoteState extends ChangeNotifier {
  List<Note> notes = [];

  void addNewNote(String title, String content) {
    notes.add(Note(title: title, content: content));
    notifyListeners();
  }
}
