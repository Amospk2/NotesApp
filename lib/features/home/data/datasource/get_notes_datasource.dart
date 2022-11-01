import 'package:notes/features/home/domain/entities/note.dart';

abstract class GetNotesDatasource
{
  Future<List<NoteEntity>> call();
}