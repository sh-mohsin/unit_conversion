import 'package:flutter/material.dart';

class UnitConverterHomePage extends StatefulWidget {
  @override
  _UnitConverterHomePageState createState() => _UnitConverterHomePageState();
}

class _UnitConverterHomePageState extends State<UnitConverterHomePage> {
  String _selectedTempUnit = 'Fahrenheit to Celsius';
  String _selectedLengthUnit = 'Kilometers to Miles';
  String _selectedWeightUnit = 'Kilograms to Pounds';

  double _inputValueTemp = 0.0;
  double _outputValueTemp = 0.0;
  double _inputValueLength = 0.0;
  double _outputValueLength = 0.0;
  double _inputValueWeight = 0.0;
  double _outputValueWeight = 0.0;

  void _convertTemperature() {
    setState(() {
      if (_selectedTempUnit == 'Fahrenheit to Celsius') {
        _outputValueTemp = (_inputValueTemp - 32) * 5 / 9; // Fahrenheit to Celsius
      } else if (_selectedTempUnit == 'Celsius to Fahrenheit') {
        _outputValueTemp = (_inputValueTemp * 9 / 5) + 32; // Celsius to Fahrenheit
      }
    });
  }

  void _convertLength() {
    setState(() {
      if (_selectedLengthUnit == 'Kilometers to Miles') {
        _outputValueLength = _inputValueLength * 0.621371; // Kilometers to Miles
      } else if (_selectedLengthUnit == 'Miles to Kilometers') {
        _outputValueLength = _inputValueLength * 1.60934; // Miles to Kilometers
      }
    });
  }

  void _convertWeight() {
    setState(() {
      if (_selectedWeightUnit == 'Kilograms to Pounds') {
        _outputValueWeight = _inputValueWeight * 2.20462; // Kilograms to Pounds
      } else if (_selectedWeightUnit == 'Pounds to Kilograms') {
        _outputValueWeight = _inputValueWeight * 0.453592; // Pounds to Kilograms
      }
    });
  }

  String _getWeightUnit(String conversionType) {
    if (conversionType == 'Kilograms to Pounds') {
      return 'lbs';
    } else if (conversionType == 'Pounds to Kilograms') {
      return 'kg';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTemperatureConversionSection(),
              SizedBox(height: 20),
              _buildLengthConversionSection(),
              SizedBox(height: 20),
              _buildWeightConversionSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTemperatureConversionSection() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton<String>(
            value: _selectedTempUnit,
            items: <String>['Fahrenheit to Celsius', 'Celsius to Fahrenheit']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedTempUnit = newValue!;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Enter Value'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _inputValueTemp = double.tryParse(value) ?? 0.0;
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            '$_outputValueTemp ${_selectedTempUnit.contains('Celsius') ? '°C' : '°F'}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _convertTemperature,
            child: Text('Convert Temperature'),
          ),
        ],
      ),
    );
  }

  Widget _buildLengthConversionSection() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton<String>(
            value: _selectedLengthUnit,
            items: <String>['Kilometers to Miles', 'Miles to Kilometers']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedLengthUnit = newValue!;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Enter Value'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _inputValueLength = double.tryParse(value) ?? 0.0;
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            '$_outputValueLength ${_selectedLengthUnit.contains('Miles') ? 'mi' : 'km'}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _convertLength,
            child: Text('Convert Length'),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightConversionSection() {
    return Container(
        padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.blueAccent),
    borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    DropdownButton<String>(
    value: _selectedWeightUnit,
    items: <String>['Kilograms to Pounds', 'Pounds to Kilograms']
        .map((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    onChanged: (String? newValue) {
    setState(() {
    _selectedWeightUnit = newValue!;
    });
    },
    ),
    TextField(
    decoration: InputDecoration(labelText: 'Enter Value'),
    keyboardType: TextInputType.number,
    onChanged: (value) {
    setState(() {
    _inputValueWeight = double.tryParse(value) ?? 0.0;
    });
    },
    ),
    SizedBox(height: 20),
    Text(
    '$_outputValueWeight ${_getWeightUnit(_selectedWeightUnit)}',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed:
      _convertWeight,
      child: Text('Convert Weight'),
    ),
    ],
    ),
    );
  }
}
