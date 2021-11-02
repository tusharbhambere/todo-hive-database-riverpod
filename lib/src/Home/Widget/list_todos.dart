import 'package:flutter/material.dart';
import 'package:todo_with_hive/src/Home/Widget/add_todo.dart';
import 'package:todo_with_hive/src/Model/todos.model.dart';

class ListTodos extends StatelessWidget {
  const ListTodos({Key? key, required this.todos}) : super(key: key);
  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTodo(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          todos.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final toded = todos[index];
                    return ListTile(
                      title: Text(toded.title),
                      subtitle: Text(toded.description),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    );
                  },
                ))
              : const Center(
                  child: Text('Empty'),
                )
        ],
      ),
    );
  }
}
