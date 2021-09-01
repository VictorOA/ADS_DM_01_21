import 'package:flutter/material.dart';
import 'package:flutter_crud/components/lista_finalizada.dart';
import 'package:flutter_crud/provider/tarefa.dart';
import 'package:provider/provider.dart';

class TelaFinalizada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Tarefas tarefas = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas Finalizadas'),
      ),
      body: ListView.builder(
          itemCount: tarefas.countFinalizada,
          itemBuilder: (ctx, i) =>
              ListaFinalizada(tarefas.porIndiceFinalizada(i))),
    );
  }
}
