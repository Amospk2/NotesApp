import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/features/home/presentation/controllers/note_controller.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController controller = GetIt.I.get<NoteController>();
    TextEditingController textController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    return BottomSheet(
      onClosing: () {
        
      },
      builder: (context) => Card(
        child: Stack(children: [
          ListView(
            children: [
              ValueListenableBuilder(
                valueListenable: controller.invalidInputs,
                builder: (context, value, child) => value
                    ? const Text(
                        "Invalid Inputs",
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Creade you note",
                style: TextStyle(fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                maxLength: 15,
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  icon: Icon(Icons.title),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 5,
                maxLength: 5000,
                controller: textController,
                decoration: const InputDecoration(
                  focusColor: Colors.white,
                  label: Text("Text"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  icon: Icon(Icons.text_fields),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
          Positioned(
            height: 50,
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 15),
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  controller.createNewNote(
                      textController.text, titleController.text);
                  if (!controller.invalidInputs.value) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  "Criar nota",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
