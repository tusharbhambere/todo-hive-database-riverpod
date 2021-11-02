import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_with_hive/src/Home/Widget/list_todos.dart';
import 'package:todo_with_hive/src/Model/todos.model.dart';
import 'package:todo_with_hive/src/Presistance/hive_database.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(datastore);
    return ValueListenableBuilder(
      valueListenable: database.getTodo(),
      builder: (context, Box<TodoModel> box, child) {
        return ListTodos(todos: box.values.toList());
      },
    );
  }
}
