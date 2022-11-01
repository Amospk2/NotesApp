import 'package:get_it/get_it.dart';
import 'package:notes/features/home/data/datasource/get_notes_datasource.dart';
import 'package:notes/features/home/data/datasource/local/get_notes_local_datasource.dart';
import 'package:notes/features/home/data/repositories/get_notes_repository_imp.dart';
import 'package:notes/features/home/domain/repositories/get_notes_repositories.dart';
import 'package:notes/features/home/domain/usecase/get_notes_usercase.dart';
import 'package:notes/features/home/domain/usecase/get_notes_usercase_imp.dart';
import 'package:notes/features/home/presentation/controllers/note_controller.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<GetNotesDatasource>(
        () => GetNotesLocalDatasource());

    getIt.registerLazySingleton<GetNotesRepository>(
        () => GetNotesRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetNotesUsercase>(() => GetNotesUsercaseImp(getIt()));

    getIt.registerLazySingleton<NoteController>(() => NoteController(getIt()));
  }
}
