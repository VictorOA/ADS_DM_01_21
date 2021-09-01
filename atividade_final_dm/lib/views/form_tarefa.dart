import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/models/tarefa.dart';
import 'package:flutter_crud/provider/tarefa.dart';
import 'package:provider/provider.dart';

class TarefaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  final Tarefa tarefaDados = Tarefa();

  void _loadFormData(Tarefa? tarefa) {
    if (tarefa != null) {
      tarefaDados.id = tarefa.id;
      tarefaDados.nome = tarefa.nome;
      tarefaDados.descricao = tarefa.descricao;
      tarefaDados.status = tarefa.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tarefa = ModalRoute.of(context)!.settings.arguments as Tarefa?;

    _loadFormData(tarefa);

    return Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Tarefa'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState!.save();
                Provider.of<Tarefas>(context, listen: false).put(
                  tarefaDados,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
                key: _form,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: tarefaDados.nome,
                      decoration: InputDecoration(labelText: 'Nome'),
                      onSaved: (value) => tarefaDados.nome = value!,
                    ),
                    TextFormField(
                      initialValue: tarefaDados.nome,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'descricao',
                      ),
                      onSaved: (value) => tarefaDados.descricao = value!,
                    ),
                  ],
                ))));
  }
}
