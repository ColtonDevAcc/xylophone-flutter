import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Color colorActive;

  void playSound(int num) {
    int Num = num;

    final player = AudioCache();
    player.play('note$Num.wav');
  }

  Expanded buildKey(Color C, int Num, String Note) {
    Color c = C;
    int num = Num;
    Color activeColor = c;
    String note = Note;

    return Expanded(
      child: FlatButton(
        textColor: Colors.white,
        child: Text(note),
        color: c,
        onPressed: () {
          playSound(num);
          setState(() {
            colorActive = c;
          });
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorActive,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // init flat buttons!
                buildKey(Colors.red, 1, 'C'),
                buildKey(Colors.orange, 2, 'D'),
                buildKey(Colors.yellow, 3, 'E'),
                buildKey(Colors.green, 4, 'F'),
                buildKey(Colors.blue, 5, 'G'),
                buildKey(Colors.blue.shade900, 6, 'A'),
                buildKey(Colors.red.shade900, 7, 'B'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
