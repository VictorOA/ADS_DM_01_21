import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/tarefa.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/form_tarefa.dart';
import 'package:flutter_crud/views/login.dart';
import 'package:flutter_crud/views/tarefa_finalizada.dart';
import 'package:flutter_crud/views/tela_inicial.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => new Tarefas(),
      child: MaterialApp(
        title: 'To-do List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.LOGIN: (_) => LoginPage(),
          AppRoutes.TAREFA_FORM: (_) => TarefaForm(),
          AppRoutes.TELA_INICIAL: (_) => TelaInicial(),
          AppRoutes.TELA_FINALIZADO: (_) => TelaFinalizada()
        },
      ),
    );
  }
}
