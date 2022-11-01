import 'package:notes/features/home/domain/entities/note.dart';

abstract class GetNotesRepository
{
  Future<List<NoteEntity>> call();
}