import 'package:calculator/calculator_controler.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(), // AppBar
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDisplay(text: _controller.result),
          Divider(color: Colors.white),
          _buildKeyboard(),
        ],
      ), // Container
    ); // Scaffold
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Calculadora', style: TextStyle(color: Colors.white)),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.share_outlined),
            onPressed: () {
              Share.share("Compartilhe com os seus amigos!",
                  subject: "Uma calculadora.");
            })
      ],
      backgroundColor: Colors.black,
    );
  }

  Widget _buildDisplay({String text}) {
    var operationDisplay;
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.bottomRight,
                child: Text(
                  operationDisplay ?? '0',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 52,
                      fontFamily: "Calculator"),
                )),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                text ?? '0',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontFamily: 'Calculator',
                  color: Colors.white,
                  fontSize: 52,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String operDisp;

  Widget _buildKeyboard() {
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.blue,
      height: height * 0.65 > 500.0 ? 500 : height * 0.65,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: 'AC', color: Colors.deepOrange),
                _buildButton(label: 'DEL', color: Colors.deepOrange),
                _buildButton(label: '%', color: Colors.deepOrange),
                _buildButton(label: '/', color: Colors.deepOrange),
              ],
            ), // Expanded
          ), // Row
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildButton(label: '7'),
              _buildButton(label: '8'),
              _buildButton(label: '9'),
              _buildButton(label: 'x', color: Colors.deepOrange),
            ],
          )), // Row
          _buildKeyboardLine1(), // Expanded
          _buildKeyboardLine2(), // Expanded
          _buildKeyboardLine3(), // Expanded
        ],
      ), // Column
    );
  }

  Widget _buildKeyboardLine1() {
    return Expanded(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildButton(label: '4'),
        _buildButton(label: '5'),
        _buildButton(label: '6'),
        _buildButton(label: '-', color: Colors.deepOrange),
      ],
    ));
  }

  Widget _buildKeyboardLine2() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '1'),
          _buildButton(label: '2'),
          _buildButton(label: '3'),
          _buildButton(label: '+', color: Colors.deepOrange),
        ],
      ), // Row
    );
  }

  Widget _buildKeyboardLine3() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '0', flex: 2),
          _buildButton(label: ','),
          _buildButton(label: '=', color: Colors.deepOrange),
        ],
      ), // Row
    ); // Expanded
  }

  Widget _buildButton(
      {String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            color: color,
          ), // TextStyle
        ), // Text
        color: Colors.black,
        onPressed: () => _calculatorLogic(label),
      ),
    ); // RaisedButton
  }

  _calculatorLogic(String label) {
    setState(() {
      _controller.applyCommand(label);
    });
  }
}
