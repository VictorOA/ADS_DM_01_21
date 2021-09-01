import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter_crud/data/tarefas_previas.dart';
import 'package:flutter_crud/models/tarefa.dart';

class Tarefas with ChangeNotifier {
  final Map<String, Tarefa> _items = {...tarefas};
  final Map<String, Tarefa> _tarefasFinalizadas = {...tarefas_finalizadas};

  List<Tarefa> get all {
    return [..._items.values];
  }

  List<Tarefa> get allFinalizada {
    return [..._tarefasFinalizadas.values];
  }

  int get count {
    return _items.length;
  }

  int get countFinalizada {
    return _tarefasFinalizadas.length;
  }

  Tarefa byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Tarefa porIndiceFinalizada(int i) {
    return _tarefasFinalizadas.values.elementAt(i);
  }

  void finaliza(Tarefa tarefa) {
    print(tarefa.id);
    tarefa.status = 'FEITO';
    _tarefasFinalizadas.putIfAbsent(tarefa.id.toString(), () => tarefa);
    _items.remove(tarefa.id.toString());
    notifyListeners();
  }

  void put(Tarefa tarefa) {
    if (_items.containsKey(tarefa.id)) {
      _items.update(tarefa.id.toString(), (_) => tarefa);
    } else {
      final id = Random().nextDouble().toInt();
      tarefa.id = id;
      _items.putIfAbsent(id.toString(), () => tarefa);
    }
    notifyListeners();
  }

  void remove(Tarefa tarefa) {
    _items.remove(tarefa.id.toString());
    notifyListeners();
  }
}
