import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.grey),
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  String title = "Home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _dollarController = TextEditingController();

  String _resultado = "";

  void _dollarToCents() {
    setState(() {
      if (_dollarController.text.isEmpty) {
        _resultado = "Insert a number";
      } else {
        double quarter, dime, nickel, penny, balance, value;

        value = double.parse(_dollarController.text) * 100;
        quarter = (value / 25).floorToDouble();
        balance = (value % 25);
        dime = (balance ~/ 10).floorToDouble();
        balance = balance % 10;
        nickel = (balance ~/ 5).floorToDouble();
        balance = balance % 5;
        penny = (balance ~/ 1).floorToDouble();

        _resultado =
            "${_dollarController} converted to cents is: $quarter quarter "
            "coins, $dime Dime coins, $nickel nickel coins and $penny coins";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dollar to Cents"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _dollarController,
                autofocus: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  hintText: "Insert a value. (eg: 1.75, 2.73)",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlue[200], width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue[500],
                  )),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _dollarToCents,
              child: Text("Converter"),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "$_resultado",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
