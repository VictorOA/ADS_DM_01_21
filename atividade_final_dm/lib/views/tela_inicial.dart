import 'package:flutter/material.dart';
import 'package:flutter_crud/components/lista_tarefa.dart';
import 'package:flutter_crud/provider/tarefa.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Tarefas tarefas = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: Text('Botao')),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.TAREFA_FORM);
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80.0,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('FUNCIONALIDADES'),
              ),
            ),
            ListTile(
              title: const Text('Tarefas Finalizadas'),
              hoverColor: Colors.grey,
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.TELA_FINALIZADO);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: tarefas.count,
          itemBuilder: (ctx, i) => ComponenteTarefa(tarefas.byIndex(i))),
    );
  }
}
