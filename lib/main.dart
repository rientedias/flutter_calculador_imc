import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Informa seu Dados";
  TextEditingController WeigthController = TextEditingController();
  TextEditingController HeigthController = TextEditingController();

  void _resetFields() {
    WeigthController.text = "";
    HeigthController.text = "";
    setState(() {
      _infoText = "Informa seu Dados";
    });
  }

  void _calculate() {
    setState(() {
      double weigth = double.parse(WeigthController.text);
      double heigth = double.parse(HeigthController.text) / 100;

      double imc = weigth / (heigth * heigth);
      print(imc);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso(${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CALCULADORA DE IMC"),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120.0, color: Colors.blue),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                controller: WeigthController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                controller: HeigthController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: _calculate,
                    child: Text(
                      "CALCULAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )
            ],
          ),
        ));
  }
}
