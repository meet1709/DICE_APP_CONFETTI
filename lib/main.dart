import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Dicee'),
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;
  bool isplaying = false;

  final _controller = ConfettiController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void changeFaceOfDice() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;

    if (leftDiceNumber ==  rightDiceNumber ) {
      isplaying = true;
    }
    else
    {
      isplaying = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
   
   
    


          Expanded(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    changeFaceOfDice();

                    if (isplaying) {
                      _controller.play();
                    } 
                    else{
                      _controller.stop();
                    }
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png')),
          ),


          Center(
      child: ConfettiWidget(
        confettiController: _controller,
        //blastDirectionality: BlastDirectionality.directional,
        blastDirection: - pi/2 ,
        gravity: 0.01,
        emissionFrequency: 0.8,
        
        ),

    ),

          Expanded(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    changeFaceOfDice();

                     if (isplaying) {
                      _controller.play();
                    } 
                    else{
                      _controller.stop();
                    }


                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png')),
          ),
        ],
      ),
    );
  }
}
