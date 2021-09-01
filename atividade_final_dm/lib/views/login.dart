import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  late String email = "";
  late String senha = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextField(
                      onChanged: (text) => email = text,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (text) => senha = text,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (email == 'admin@gmail.com' &&
                                  senha == 'admin') {
                                print('login correto');
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              } else {
                                print('login errado');
                              }
                            },
                            child: Text('Logar')),
                      ],
                    ),
                    Text(
                      'Esqueci a senha',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                    ),
                  ],
                ))),
      ),
    );
  }
}
