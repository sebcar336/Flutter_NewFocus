import 'package:flutter/material.dart';
import 'package:new_focus_/model.dart';
import 'package:new_focus_/task_folder/task_creator.dart';
import 'package:new_focus_/task_folder/task_widget.dart';
import 'package:new_focus_/widgets/app_bar.dart';

import '../main.dart';
import '../objectbox.g.dart';
import '../styles/palleta.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Box<Task>? taskBox;
  Stream<List<Task>>? fetchAllTask;

  @override
  void initState() {
    super.initState();
    taskBox = objectBox.store.box<Task>();
    print(taskBox!.count());
    setState(() {
      fetchAllTask = taskBox!
          .query()
          .watch(triggerImmediately: true)
          .map((event) => event.find());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 28.0,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'To-Do List',
                      style: TextStyle(
                        color: Pallete.text,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(width: 70),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Pallete.borderColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TaskCreatorScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        color: Pallete.customColor1,
                        iconSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              StreamBuilder<List<Task>>(
                stream: fetchAllTask!,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final tasks = snapshot.data ?? [];

                    if (tasks.isEmpty) {
                      return const Center(
                        child: Text(
                          'No hay tareas. ¡Crea una nueva!',
                          style: TextStyle(
                            color: Pallete.text,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskWidget(tasks[index]);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
