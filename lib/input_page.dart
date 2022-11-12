import 'dart:ui';
import 'result.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bodyStyle = TextStyle(
  color: Colors.grey,
  fontSize: 16,
  decoration: TextDecoration.none,
);
const labelStyle = TextStyle(
  color: Colors.white70,
  fontSize: 50,
  fontWeight: FontWeight.w900,
  decoration: TextDecoration.none,
);
const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF0A0E21);

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  int sex=-1;
  int height = 180;
  int weight = 80;
  int age = 18;
  var male = inactiveColor;
  var female = inactiveColor;
  void setColour(int gender) {
    if (gender == 1) {
      if (male == inactiveColor) {
        sex=0;
        male = activeColor;
        female = inactiveColor;
      } else {
        sex=-1;
        male = inactiveColor;
      }
    } else {
      if (female == inactiveColor) {
        sex=1;
        female = activeColor;
        male = inactiveColor;
      } else {
        sex=-1;
        female = inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppBar(
            title: Text('BMR Calculator'),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        setColour(1);
                      });
                    },
                    child: ReCard(
                      colour: male,
                      childRecard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 100,
                            color: Colors.grey[400],
                          ),
                          Text(
                            'Male',
                            style: bodyStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        setColour(2);
                      });
                    },
                    child: ReCard(
                      colour: female,
                      childRecard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 100,
                            color: Colors.grey[400],
                          ),
                          Text(
                            'Female',
                            style: bodyStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReCard(
                    colour: activeColor,
                    childRecard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: bodyStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: labelStyle,
                            ),
                            Text(
                              'cm',
                              style: bodyStyle,
                            )
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          label: height.toString(),
                          min: 120,
                          max: 220,
                          onChanged: (double h) {
                            setState(() {
                              height = h.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReCard(
                    colour: activeColor,
                    childRecard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: bodyStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: labelStyle,
                            ),
                            Text(
                              'kg',
                              style: bodyStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReCard(
                    colour: activeColor,
                    childRecard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: bodyStyle,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(age.toString(),style: labelStyle,),
                            Text('yrs',style: bodyStyle,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: (){setState(() {
                              age++;
                            });}, child: Icon(FontAwesomeIcons.plus,),),
                            SizedBox(width: 15,),
                            ElevatedButton(onPressed: (){setState(() {
                              age--;
                            });}, child: Icon(FontAwesomeIcons.minus,),),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ReCard(colour: activeColor,childRecard: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Calculate",style: bodyStyle,),
                Icon(Icons.arrow_forward_outlined,color: Colors.white70,),
              ],
            ),
            onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return Result(height: height,
                      weight: weight,
                      gender: sex,
                      age: age);
                },
                ),
              );
            },
          ),)
        ],
      ),
    );
  }
}

class ReCard extends StatelessWidget {
  final Color colour;
  final Widget childRecard;
  ReCard({@required this.colour, this.childRecard});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: childRecard,
    );
  }
}
