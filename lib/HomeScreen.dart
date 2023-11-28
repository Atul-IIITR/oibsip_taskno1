import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextStyle labelStyle = TextStyle(
    fontSize: 16.0,
      color: Colors.black,
      fontWeight: FontWeight.w400
  );
  final TextStyle resultSyle = TextStyle(
    color: Colors.black,
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
  );
  final List<String> _Mesaurments = [
    'Meters',
    'Kilometers',
    'Grams',
    'Kilograms',
    'Feet',
    'Miles',
  ];
  late double _value;
  String _fromMesaures = 'Grams';
  String _toMesaures = 'Kilograms';
  String _results = "";

  final Map<String, int> _mesauresMap = {
    'Meters': 0,
    'Kilometers': 1,
    'Grams': 2,
    'Kilograms': 3,
    'Feet': 4,
    'Miles': 5,
  };
  dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the Value',
                focusColor: Colors.black,
              ),
              onChanged: (value) {
                setState(() {
                  _value = double.parse(value);
                });
              },
            ),

            SizedBox(height: 35.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('From', style: TextStyle(fontSize: 18),
                    ),
                    DropdownButton(
                      items: _Mesaurments.map((String value) => DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      )).toList(),
                      onChanged: (value) {
                        setState(() {
                          _fromMesaures = value!;
                        });
                      },
                      value: _fromMesaures,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('To', style: TextStyle(fontSize: 18),
                    ),
                    DropdownButton(
                      items: _Mesaurments
                          .map((String value) => DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _toMesaures = value!;
                        });
                      },
                      value: _toMesaures,
                    )
                  ],
                ),
              ],
            ),
            Container(
              width: 300,
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: _convert,
                child: Text(
                  'CONVERT',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 25.0),
            Text(
              _results,
              style: resultSyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _convert() {
    print('Button Clicked');
    print(_value);

    if (_value != 0 && _fromMesaures.isNotEmpty && _toMesaures.isNotEmpty) {
      var from = _mesauresMap[_fromMesaures];
      var to = _mesauresMap[_toMesaures];

      var multiplier = _formulas[from.toString()][to];
      setState(() {
        _results =
        "$_value $_fromMesaures = ${_value * multiplier} $_toMesaures";
      });
    } else {
      setState(() {
        _results = "Please enter a non zero value";
      });
    }
  }
}