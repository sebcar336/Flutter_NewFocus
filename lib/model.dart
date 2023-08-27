import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id;

  String title;
  bool isCompleted;

  Task({this.id = 0, required this.title, this.isCompleted = false});
}
