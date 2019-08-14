import 'package:flutter/material.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Center(
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 105.0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.navigate_before),
                      onPressed: (){},
                    ),
                    Text('Example'),
                    IconButton(
                      icon: Icon(Icons.navigate_next),
                      onPressed: (){},
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
                onPressed: (){},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: MaterialButton(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Text('Exit', style: TextStyle(fontSize: 15.0, color: Colors.white),),),
                onPressed: (){},
              ),
            )
          ],
        ),
      )
    );
  }
}
