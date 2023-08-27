import 'package:flutter/material.dart';
import 'package:new_focus_/main.dart';
import 'package:new_focus_/model.dart';
import 'package:new_focus_/styles/palleta.dart';
import 'package:objectbox/objectbox.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget(this.task, {Key? key}) : super(key: key);
  final Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Box<Task> taskBox = objectBox.store.box<Task>();

  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Pallete.backgroundColor,
          title: const Text(
            '¿Estás seguro?',
            style: TextStyle(
                color: Pallete.text, fontWeight: FontWeight.w600, fontSize: 22),
          ),
          content: Text(
            '¿Quieres eliminar la tarea "${widget.task.title}"?',
            style: const TextStyle(
                color: Pallete.text, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Pallete.appBarNew,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: Pallete.appBarNewShadow,
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Eliminar',
                style: TextStyle(
                  color: Pallete.appBarFocus,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: Pallete.appBarFocusShadow,
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                taskBox.remove(widget.task.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 45),
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.borderColor, width: 3),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.scale(
            scale: 1.1,
            child: Checkbox(
              side: const BorderSide(color: Pallete.customColor1),
              shape: const CircleBorder(),
              value: widget.task.isCompleted,
              onChanged: (bool? value) {
                widget.task.isCompleted = value!;
                taskBox.put(widget.task);
              },
              activeColor: Pallete.customColor1,
            ),
          ),
          Expanded(
            child: Text(
              widget.task.title,
              style: TextStyle(
                color: widget.task.isCompleted
                    ? Pallete.borderColor
                    : Pallete.text,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog();
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Pallete.customColor1,
              shadows: [
                Shadow(
                  color: Pallete.customShadow1,
                  blurRadius: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
