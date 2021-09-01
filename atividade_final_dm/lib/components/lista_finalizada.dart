import 'package:flutter/material.dart';
import 'package:flutter_crud/models/tarefa.dart';
import 'package:flutter_crud/provider/tarefa.dart';
import 'package:provider/provider.dart';

class ListaFinalizada extends StatelessWidget {
  final Tarefa tarefa;

  const ListaFinalizada(this.tarefa);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tarefa.nome),
      subtitle: Text(tarefa.descricao),
    );
  }
}
