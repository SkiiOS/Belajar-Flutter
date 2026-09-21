import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Input Angka 1"),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Input Angka 2"),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(onPressed: null, child: Text("+")),
              ),
              Expanded(
                child: ElevatedButton(onPressed: null, child: Text("-")),
              ),
              Expanded(
                child: ElevatedButton(onPressed: null, child: Text("x")),
              ),
              Expanded(
                child: ElevatedButton(onPressed: null, child: Text("/")),
              ),
            ],
          ),
          Text("Hasil: "),
        ],
      ),
    );
  }
}
