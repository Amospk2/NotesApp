// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NoteEntity {
  final String title;
  final String text;

  NoteEntity({required this.title, required this.text});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'text': text,
    };
  }

  factory NoteEntity.fromMap(Map<String, dynamic> map) {
    return NoteEntity(
      title: map['title'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteEntity.fromJson(String source) => NoteEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
