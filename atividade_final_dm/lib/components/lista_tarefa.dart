import 'package:flutter/material.dart';
import 'package:flutter_crud/models/tarefa.dart';
import 'package:flutter_crud/provider/tarefa.dart';
import 'package:provider/provider.dart';

class ComponenteTarefa extends StatelessWidget {
  final Tarefa tarefa;

  const ComponenteTarefa(this.tarefa);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(tarefa.nome),
        subtitle: Text(tarefa.descricao),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.done_sharp),
                color: Colors.green,
                onPressed: () {
                  Provider.of<Tarefas>(context, listen: false).finaliza(tarefa);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                              title: Text('Excluir Tarefa'),
                              content: Text('Deseja excluir a tarefa?'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Não')),
                                TextButton(
                                    onPressed: () {
                                      Provider.of<Tarefas>(context,
                                              listen: false)
                                          .remove(tarefa);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Sim'))
                              ]));
                },
              ),
            ],
          ),
        ));
  }
}
