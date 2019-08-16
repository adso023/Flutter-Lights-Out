import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget{

  Game({@required this.dim});

  final int dim;

  @override
  createState() => _GameState(dim: dim);
}

class _GameState extends State<Game>{

  _GameState({@required this.dim});

  List<List<bool>> _states = [];

  int dim;
  bool _showSolution = false;
  bool _gameOver = false;
  int _numSteps = 0;

  @override
  void initState() {
    super.initState();

    for(int i = 0; i < dim; i++){
      _states.add([]);

      for(int j = 0; j < dim; j++){
        _states[i].add(false);
      }
    }
  }

  Widget _buildGridItems(BuildContext context, int index){
    int stateLength = _states.length;

    int x, y = 0;

    x = (index / stateLength).floor();
    y = (index % stateLength);
    return GestureDetector(
      onTap: (){

        setState(() {
         _tappedItems(x, y);
        });


      },
      child: GridTile(
        child: Container(
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black, width: 0.5)
          ),
          child: Container(child: (_states[x][y]) ? Image.asset('assets/images/Light-0.png') : Image.asset('assets/images/Light-1.png')),
        ),
      ),
    );
  }

  void _tappedItems(int x, int y){
    _states[x][y] = !_states[x][y];

    if(x > 0){
      _states[x-1][y] = !_states[x-1][y];
    }
    if(x < _states.length-1){
      _states[x+1][y] = !_states[x+1][y];
    }
    if(y > 0){
      _states[x][y-1] = !_states[x][y-1];
    }
    if(y < _states.length-1){
      _states[x][y+1] = !_states[x][y+1];
    }

    _numSteps++;
  }

  void randomize(){
    setState(() {
     for(int i = 0; i < _states.length; i++){
        for(int j = 0; j < _states[i].length; j++){
          _states[i][j] = Random().nextBool();
        }
      } 
    });
  }

  void _reset(){
    setState(() {
     for(int i = 0; i < dim; i++){
        for(int j = 0; j < dim; j++){
          _states[i][j] = false;
        }
      }

      _numSteps = 0;
      _gameOver = false;
    });
  }

  bool _checkFinished(){
    for(int i = 0; i < dim; i++){
      for(int j = 0; j < dim; j++){
        if(_states[i][j] == false){
          return false;
        }
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {

    
    _gameOver = _checkFinished();

    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: _gameOver ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _BlinkingText(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text('Finished in $_numSteps steps', style: TextStyle(fontSize: 15.0),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: MaterialButton(
                elevation: 20.0,
                color: Colors.red,
                child: Text('Reset', style: TextStyle(fontSize: 15.0),),
                onPressed: _reset,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MaterialButton(
                elevation: 20.0,
                color: Colors.grey,
                child: Text('Exit', style: TextStyle(fontSize: 15.0),),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ) : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: dim
                ),
                itemCount: (dim * dim),
                itemBuilder: _buildGridItems,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _showSolution,
                  onChanged: (bool newValue){
                    setState(() {
                     _showSolution = newValue; 
                    });
                  },
                ),
                ! _showSolution ? Text('Show Solution') : Text('Hide Solution'),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: MaterialButton(
                    color: Colors.red,
                    child: Text('Randomize'),
                    onPressed: randomize,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: MaterialButton(
                    color: Colors.grey,
                    child: Text('Reset'),
                    onPressed: _reset,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('Number of steps: $_numSteps', style: TextStyle(fontSize: 20.0),),
          )
        ],
      )
    );
  }
}

class _BlinkingText extends StatefulWidget{

  @override
  createState() => _BlinkingTextWidget();
}

class _BlinkingTextWidget extends State<_BlinkingText> with TickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat();

  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Text(
        'Game Finished',
        style: TextStyle(
          fontSize: 20.0, color: Colors.red
        ),
      ),
    );
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }
}