import 'dart:io';
import 'dart:ui';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Atlas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int sale = 0;
  int entra = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.title),
            Container(
                width: 30,
                child: Image.asset(
                  'lib/assets/atlas_logo.png',
                  fit: BoxFit.scaleDown,
                ))
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(2, 100, 2, 30),
            image: DecorationImage(
              alignment: Alignment.center,
              image: AssetImage("lib/assets/soccer_field.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ShowBenchFloatingButton(nroSale: 1),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: ShowBenchFloatingButton(nroSale: 4),
                        ),
                        ShowBenchFloatingButton(nroSale: 2),
                        ShowBenchFloatingButton(nroSale: 6),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: ShowBenchFloatingButton(nroSale: 3),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 28, bottom: 16.0, left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ShowBenchFloatingButton(nroSale: 8),
                        Column(
                          children: <Widget>[
                            ShowBenchFloatingButton(nroSale: 5),
                            Padding(
                              padding: EdgeInsets.only(bottom: 70),
                            ),
                            ShowBenchFloatingButton(nroSale: 10),
                          ],
                        ),
                        ShowBenchFloatingButton(nroSale: 7),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(16.0)),
                        ShowBenchFloatingButton(nroSale: 9),
                        ShowBenchFloatingButton(nroSale: 11),
                        Padding(padding: EdgeInsets.all(16.0)),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      //floatingActionButton:
      //    ShowBenchFloatingButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _selectForReplace(int nroSale) {
    this.sale = nroSale;
    developer.log("[PLAYER] selected for change ${nroSale}");
  }
}

class Cambio {
  int nroSale;
  int nroEntra;
  static Cambio _cambio = Cambio._internal();

  factory Cambio() {
    return _cambio;
  }

  Cambio._internal() {
    nroEntra = 0;
    nroSale = 0;
  }
}

class ShowBenchFloatingButton extends StatelessWidget {
  int nroSale;

  ShowBenchFloatingButton({key, this.nroSale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonText = nroSale != null ? nroSale.toString() : "sup";
    return FloatingActionButton(
      child: Text(buttonText),
      onPressed: () {
        Cambio().nroSale = nroSale;
        showBottomSheet(
            context: context,
            builder: (context) => Container(
                  width: window.physicalSize.width,
                  margin: const EdgeInsets.all(8),
                  height: 250,
                  //color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 40, top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(TextSpan(
                                text: "Banco de Suplentes",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                            Image.asset(
                              'lib/assets/consulmed.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircularButton(num: 12),
                            CircularButton(num: 13),
                            CircularButton(num: 14),
                            CircularButton(num: 15),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircularButton(num: 16),
                            CircularButton(num: 17),
                            CircularButton(num: 18),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
      },
    );
  }
}

class CircularButton extends StatelessWidget {
  final num;

  const CircularButton({Key key, this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonText = num != null ? num.toString() : "sup";
    return RawMaterialButton(
      onPressed: () {
        Cambio().nroEntra = int.parse(buttonText);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Sugerir cambio"),
                content: Text("Deseas confirmar el cambio?"),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancelar")),
                  FlatButton(
                      onPressed: () {
                        _enviarCambio();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text("Confirmar"))
                ],
              );
            });
      },
      elevation: 2.0,
      fillColor: Colors.brown,
      textStyle: TextStyle(color: Colors.white),
      child: Text(buttonText),
      padding: EdgeInsets.all(22.0),
      shape: CircleBorder(),
    );
  }

  Future<http.Response> _enviarCambio() {
    var url = "http://138.68.71.31/api/cambio";
    return http.post(url, body: {
      'nroEntra': Cambio().nroEntra.toString(),
      'nroSale': Cambio().nroSale.toString()
    });
  }
}
