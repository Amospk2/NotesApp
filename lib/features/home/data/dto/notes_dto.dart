import 'package:notes/features/home/domain/entities/note.dart';

extension NoteDto on NoteEntity{
  Map toJson(){
      return {
      'title':title,
      'text':text
    };
  }

  static NoteEntity fromJson(Map json){
    return NoteEntity(
      title: json['title'], 
      text: json['text']
    );
  }


  
}