import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/features/home/presentation/controllers/note_controller.dart';
import 'package:notes/features/home/presentation/ui/widgets/card_note_widget.dart';
import 'package:notes/features/home/presentation/ui/widgets/custom_bottom_shet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NoteController controller;

  @override
  void initState() {
    controller = GetIt.I.get<NoteController>();
    controller.loadLocalNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.noteEntitys!,
        builder: (context, value, child) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: controller.noteEntitys!.value.length,
          itemBuilder: (context, index) => CardNoteWidget(
              title: value[index].title, text: value[index].text),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => const CustomBottomSheet());
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
