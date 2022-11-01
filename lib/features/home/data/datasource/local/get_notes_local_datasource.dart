import 'dart:convert';
import 'package:notes/features/home/data/datasource/get_notes_datasource.dart';
import 'package:notes/features/home/data/dto/notes_dto.dart';
import 'package:notes/features/home/domain/entities/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetNotesLocalDatasource implements GetNotesDatasource
{
  @override
  Future<List<NoteEntity>> call() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? notes = prefs.getStringList('notes');
    return notes == [] ? []: notes!.map((e) => NoteDto.fromJson(jsonDecode(e))).toList();
  }
}