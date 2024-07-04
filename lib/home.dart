import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double _bmi = 0;
  String _category = '';

  void _calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi < 18.5) {
        _category = 'Kurang Berat Badan';
      } else if (_bmi >= 18.5 && _bmi <= 25) {
        _category = 'Normal';
      } else {
        _category = 'Kelebihan Berat Badan';
      }
    });
  }

  Color _getCategoryColor() {
    if (_bmi < 18.5) {
      return Colors.yellow;
    } else if (_bmi >= 18.5 && _bmi <= 25) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Hitung BMI Anda',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: 'Berat Badan (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: 'Tinggi Badan (cm)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 20),
            _bmi == 0
                ? Container()
                : Text(
                    'BMI: ${_bmi.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24),
                  ),
            SizedBox(height: 20),
            _category.isEmpty
                ? Container()
                : Text(
                    'Kategori: $_category',
                    style: TextStyle(fontSize: 24, color: _getCategoryColor()),
                  ),
          ],
        ),
      ),
    );
  }
}
