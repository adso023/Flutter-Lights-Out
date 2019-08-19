

import 'package:flutter/foundation.dart';

class Model {

  List<List<bool>> _model;
  int dim;
  bool _showSolution = false;
  int _numSteps = 0;

  Model({@required int dim}){
    this.dim = dim;

    _model = List<List<bool>>();

  }

  void reset(){
    for(int i = 0; i < dim; i++){
      _model.add([]);
      for(int j = 0; j < dim; j++){
        _model[i].add(false);
      }
    }
  }

  bool checkWinner(){
    for(List<bool> i in _model){
      for(int j = 0; j < i.length; j++){
        if(i[j] == false) return false;
      }
    }

    return true;
  }

  int get height => dim;

  int get getWidth => dim;

  int get numberOfSteps => _numSteps;

  set incrementSteps(value) => _numSteps = value;

  bool getState(int x, int y) => _model[x][y];

  bool getShowSolution() => _showSolution;
}