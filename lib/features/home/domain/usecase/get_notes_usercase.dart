import 'package:notes/features/home/domain/entities/note.dart';

abstract class GetNotesUsercase
{
  Future<List<NoteEntity>> call();
}