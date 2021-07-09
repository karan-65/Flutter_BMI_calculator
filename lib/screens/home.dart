import 'package:flutter/material.dart';
import 'package:flutter_calculator/widegts/leftbar.dart';
import 'package:flutter_calculator/widegts/rightbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  String _textresult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.limeAccent[400], fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.limeAccent[400],
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8),
                        )),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.limeAccent[400],
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiresult = _w / (_h * _h);
                  if (_bmiresult > 25) {
                    _textresult = ('You are over weight');
                  } else if (_bmiresult >= 18.5 && _bmiresult <= 25) {
                    _textresult = ('You have normal weight');
                  } else {
                    _textresult = 'You are under weight';
                  }
                });
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.limeAccent[400],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiresult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: Colors.limeAccent[400]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textresult.isNotEmpty,
              child: Container(
                child: Text(
                  _textresult,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.limeAccent[400],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(
              barWidth: 40,
            ),
          ],
        ),
      ),
    );
  }
}
