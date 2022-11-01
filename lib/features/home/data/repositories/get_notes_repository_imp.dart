import 'package:notes/features/home/data/datasource/get_notes_datasource.dart';
import 'package:notes/features/home/domain/entities/note.dart';
import 'package:notes/features/home/domain/repositories/get_notes_repositories.dart';

class GetNotesRepositoryImp implements GetNotesRepository
{

  final GetNotesDatasource _getNotesDatasource;

  GetNotesRepositoryImp(this._getNotesDatasource);

  @override
  Future<List<NoteEntity>> call() async{
    return await _getNotesDatasource();
  }
  
}