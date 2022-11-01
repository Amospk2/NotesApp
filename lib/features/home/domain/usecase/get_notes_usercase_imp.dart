



import 'package:notes/features/home/domain/entities/note.dart';
import 'package:notes/features/home/domain/repositories/get_notes_repositories.dart';
import 'package:notes/features/home/domain/usecase/get_notes_usercase.dart';

class GetNotesUsercaseImp implements GetNotesUsercase
{
  final GetNotesRepository _getNotesRepository;

  GetNotesUsercaseImp(this._getNotesRepository);

  @override
  Future<List<NoteEntity>> call() async {
    return await _getNotesRepository();
  }
  
}