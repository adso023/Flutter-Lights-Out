import 'package:flutter/material.dart';

class Tile extends StatefulWidget{

  Tile({this.x, this.y, this.width, this.height});

  final int x;
  final int y;
  final double width;
  final double height;

  @override
  createState() => _TileState();
}

class _TileState extends State<Tile>{

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(

      ),
    );
  }
}