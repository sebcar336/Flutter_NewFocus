import 'package:flutter/material.dart';
import 'package:new_focus_/main.dart';
import 'package:new_focus_/model.dart';
import 'package:new_focus_/objectbox.g.dart';
import 'package:new_focus_/widgets/app_bar.dart';
import 'package:flutter/services.dart';

import '../styles/palleta.dart';

class TaskCreatorScreen extends StatefulWidget {
  const TaskCreatorScreen({super.key});

  @override
  State<TaskCreatorScreen> createState() => _TaskCreatorScreenState();
}

class _TaskCreatorScreenState extends State<TaskCreatorScreen> {
  Box<Task> taskBox = objectBox.store.box<Task>();

  final TextEditingController _taskTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 18),
            children: [
              StylizedText(
                firstPart: '  New ',
                secondPart: 'Focus',
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'To-Do Create',
                style: TextStyle(
                  color: Pallete.text,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  border: Border.all(
                    color: Pallete.borderColor,
                    width: 3,
                  ),
                ),
                child: TextField(
                  controller: _taskTitleController,
                  style: const TextStyle(color: Pallete.text),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(40),
                  ],
                  decoration: const InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Pallete.borderColor),
                    hintText: "Name your task",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      String taskTitle = _taskTitleController.text;
                      if (taskTitle.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Por favor, ingresa un nombre para la tarea.'),
                          ),
                        );
                      } else {
                        Task model = Task(
                          title: taskTitle,
                          isCompleted: false,
                        );
                        taskBox.put(model);
                        Navigator.pop(context, true);
                      }
                    },
                    color: Pallete.customColor1,
                    elevation: 0.0,
                    child: const Text("Save Task"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
