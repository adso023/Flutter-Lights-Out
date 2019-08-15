import 'package:flutter/material.dart';

class Game extends StatefulWidget{

  Game({@required this.dim});

  int dim;

  @override
  createState() => _GameState(dim: dim);
}

class _GameState extends State<Game>{

  _GameState({@required this.dim});

  int dim;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: GridView.count(
        crossAxisCount: dim,
        children: List.generate(dim, (index){
          return ListTile(
            title: Text(index.toString()),
          );
        }),
      ),
    );
  }
}