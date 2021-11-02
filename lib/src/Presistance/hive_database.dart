import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_with_hive/src/Model/todos.model.dart';

class LocalDatabase {
  static const todokey = 'todoskeys';

  Future<void> initState() async {
    await Hive.initFlutter();
    Hive.registerAdapter<TodoModel>(TodoModelAdapter());
    await Hive.openBox<TodoModel>(todokey);
  }

  Future<void> addTodo(TodoModel model) async {
    final database = Hive.box<TodoModel>(todokey);
    if (database.values.isEmpty) {
      await database.add(model);
    } else {
      final index = database.values
          .toList()
          .indexWhere((taskAtIndex) => taskAtIndex.id == model.id);
      if (index >= 0) {
        await database.put(index, model);
      } else {
        await database.add(model);
      }
    }
  }

  ValueListenable<Box<TodoModel>> getTodo() {
    return Hive.box<TodoModel>(todokey).listenable();
  }
}

final datastore = Provider<LocalDatabase>((ref) {
  throw UnimplementedError();
});
