import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lightsout_app/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> _lstLevels = [
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(3.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(4.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(5.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(6.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(7.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(8.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(9.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(10.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(11.toString()),),),
    Card(child: Padding(padding: const EdgeInsets.all(40.0), child: Text(12.toString()),),)
  ];

  Card _currLevel;
  int _currIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    _currLevel = _lstLevels.elementAt(_currIndex);

    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25.0,),
            Center(
              child: AnimatedSwitcher(
                child: _currLevel,
                duration: const Duration(seconds: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 80.0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.navigate_before, size: 32.0,),
                      onPressed: (){
                        if(_currIndex != 0){
                          setState(() {
                           _currIndex-=1; 
                          });
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text('Levels', style: TextStyle(fontSize: 20.0),),
                    ),
                    IconButton(
                      icon: Icon(Icons.navigate_next, size: 32.0,),
                      onPressed: (){
                        if(_currIndex != _lstLevels.length-1){
                          setState(() {
                           _currIndex+=1; 
                          });
                        }
                      },
                    )
                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: MaterialButton(
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0), 
                  child: Text('Start Game', style: TextStyle(fontSize: 15.0, color: Colors.white),),),
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Game(dim: (_currIndex+3),)
                  ));

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: MaterialButton(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Text('Exit', style: TextStyle(fontSize: 15.0, color: Colors.white),),),
                onPressed: (){
                  exit(0);
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
