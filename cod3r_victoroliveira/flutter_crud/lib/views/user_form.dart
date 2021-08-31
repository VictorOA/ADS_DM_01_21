import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id!;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User?;

    _loadFormData(user);

    return Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Usuário'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState!.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'].toString(),
                  name: _formData['name'].toString(),
                  email: _formData['email'].toString(),
                  avatarUrl: _formData['avatarUrl'].toString(),
                ));
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
                      initialValue: _formData['name'],
                      decoration: InputDecoration(labelText: 'Nome'),
                      onSaved: (value) => _formData['name'] = value!,
                    ),
                    TextFormField(
                      initialValue: _formData['email'],
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (value) => _formData['email'] = value!,
                    ),
                    TextFormField(
                      initialValue: _formData['avatarUrl'],
                      decoration: InputDecoration(labelText: 'Url do Avatar'),
                      onSaved: (value) => _formData['avatarUrl'] = value!,
                    )
                  ],
                ))));
  }
}
