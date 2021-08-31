import 'package:aplicacaoteste/appcontroller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  int counter = 0;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    var container = new Container(
        height: 500,
        width: 500,
        color: Colors.red,
        alignment: Alignment.center,
        child: new Container(
          child: Text('Hello World'.toUpperCase()),
          alignment: Alignment.center,
          height: 200,
          width: 200,
          color: Colors.green,
        ));
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Aplicativo',
        ),
        centerTitle: true,
        actions: [CustomSwitch()],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(children: [
            Center(child: CustomSwitch()),
            Container(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child: IconButton(icon: Icon(Icons.add), onPressed: () {}),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                )
              ],
            )
          ])),
      floatingActionButton: new FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.red,
        tooltip: 'Clique para  adicionar',
        child: Icon(Icons.add_circle),
      ),
    );
  }

  void onPressed() {
    setState(() {
      if (counter == 10) {
        counter = 0;
      } else {
        counter++;
      }
    });
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDark,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
