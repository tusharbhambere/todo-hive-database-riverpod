import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'todos.model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  TodoModel({required this.id, required this.title, required this.description});

  factory TodoModel.createTodoId(
      {required String title, required String description}) {
    final id = Uuid().v1();
    return TodoModel(id: id, title: title, description: description);
  }
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
}
