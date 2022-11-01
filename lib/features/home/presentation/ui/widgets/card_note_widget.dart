import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/features/home/presentation/controllers/note_controller.dart';
import 'package:notes/features/home/presentation/ui/pages/details_page.dart';

class CardNoteWidget extends StatelessWidget {
  final String title;
  final String text;
  const CardNoteWidget({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<NoteController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsPage(title: title, text: text))),
        child: Card(
            elevation: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 35,
                          color: Colors.redAccent,
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(title,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white)),
                              const SizedBox(
                                width: 50,
                              ),
                              IconButton(
                                  alignment: Alignment.topRight,
                                  onPressed: () {
                                    controller.deleteNote(title, text);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 25,
                                  ))
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
