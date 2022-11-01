import 'package:flutter/material.dart';
import 'package:notes/features/home/domain/entities/note.dart';
import 'package:notes/features/home/domain/usecase/get_notes_usercase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteController {
  final GetNotesUsercase _getNotesUsercase;
  ValueNotifier<List<NoteEntity>>? noteEntitys =
      ValueNotifier<List<NoteEntity>>([]);
  ValueNotifier<bool> invalidInputs = ValueNotifier<bool>(false);

  NoteController(this._getNotesUsercase);

  createNewNote(String text, String title) async {
    if (text != "" && title != "") {
      noteEntitys!.value =
          noteEntitys!.value + [NoteEntity(title: title, text: text)];
      invalidInputs.value = false;
      await saveNotesInLocal();
    } else {
      invalidInputs.value = true;
    }
  }

  loadLocalNotes() async {
    noteEntitys!.value = await _getNotesUsercase();
  }

  saveNotesInLocal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'notes', noteEntitys!.value.map((e) => e.toJson()).toList());
    await loadLocalNotes();
  }

  deleteNote(String title, String text) {
    noteEntitys!.value = noteEntitys!.value
        .where((element) => element.text != text || element.title != title)
        .toList();
  }
}
