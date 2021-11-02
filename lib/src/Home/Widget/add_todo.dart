import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_with_hive/src/Model/todos.model.dart';
import 'package:todo_with_hive/src/Presistance/hive_database.dart';

class AddTodo extends HookConsumerWidget {
  AddTodo({Key? key}) : super(key: key);
  final TextEditingController tile = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: tile,
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: description,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                final models = TodoModel.createTodoId(
                    title: tile.text, description: description.text);
                ref.read(datastore).addTodo(models);
              },
              child: const Text('summit'))
        ],
      ),
    );
  }
}
