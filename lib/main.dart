import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'componets_demo_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Calculator'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.calculate_outlined)
                  ],
                ),
                backgroundColor: Colors.teal,
                titleTextStyle: const TextStyle(fontSize: 25)),
            body: Column(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                          Align(
                            alignment: Alignment.bottomRight
                            ,child: Text(
                              userInput.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            answer.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )
                        ]))),
                Expanded(
                  flex: 3,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            MyBtn(
                                title: 'AC',
                                onPress: () {
                                  userInput = '';
                                  answer = '';
                                  setState(() {

                                  });
                                }),
                            MyBtn(title: '*/-', onPress: () {
                              userInput += '*/-';
                              setState(() {

                              });
                            }),
                            MyBtn(title: '%', onPress: () {
                              userInput += '%';
                              setState(() {

                              });

                            }),
                            MyBtn(
                                title: '/',
                                chosColor: Colors.orangeAccent,
                                onPress: () {
                                  userInput += '/';
                                  setState(() {

                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            MyBtn(
                                title: '7',
                                onPress: () {
                                  userInput += '7';
                                  setState(() {});
                                }),
                            MyBtn(title: '8', onPress: () {
                              userInput += '8';
                              setState(() {

                              });
                            }),
                            MyBtn(title: '9', onPress: () {
                              userInput += '9';
                              setState(() {

                              });
                            }),
                            MyBtn(
                                title: '*',
                                chosColor: Colors.orangeAccent,
                                onPress: () {
                                  userInput += '*';
                                  setState(() {

                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            MyBtn(title: '4', onPress: () {
                              userInput += '4';
                              setState(() {

                              });
                            }),
                            MyBtn(title: '5', onPress: () {
                              userInput += '5';
                              setState(() {

                              });
                            }),
                            MyBtn(title: '6', onPress: () {
                              userInput += '6';
                              setState(() {

                              });
                            }),
                            MyBtn(
                                title: '-',
                                chosColor: Colors.orangeAccent,
                                onPress: () {
                                  userInput += '-';
                                  setState(() {

                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            MyBtn(title: '1', onPress: () {
                              userInput += '1';
                              setState(() {

                              });
                            }),
                            MyBtn(title: '2', onPress: () {
                              userInput += '2';
                              setState(() {

                              });
                            }),
                            MyBtn(title: '3', onPress: () {
                              userInput += '3';
                              setState(() {

                              });
                            }),
                            MyBtn(
                                title: '+',
                                chosColor: Colors.orangeAccent,
                                onPress: () {
                                  userInput += '+';
                                  setState(() {

                                  });
                                })
                          ],
                        ),
                        Row(
                          children: [
                            MyBtn(title: '0', onPress: () {
                              userInput += '0';
                              setState(() {

                              });
                            }),
                            MyBtn(title: '.', onPress: () {
                              userInput += '.';
                              setState(() {

                              });
                            }),
                            MyBtn(title: 'Dell', onPress: () {
                              userInput = userInput.substring(0,userInput.length-1);
                              setState(() {

                              });
                            }),
                            MyBtn(
                                title: '=',
                                chosColor: Colors.orangeAccent,
                                onPress: () {
                                  equalPress();
                                  setState(() {

                                  });
                                })
                          ],
                        )
                      ]),
                )
              ],
            )),
      ),
    );



  }

  void equalPress(){
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
