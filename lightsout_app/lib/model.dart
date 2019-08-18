
class Model {

  List<List<bool>> _model;
  int dim;
  bool _showSolution = false;
  bool _gameOver = false;
  int _numSteps = 0;

  Model({int dim}){
    this.dim = dim;

    _model = List<List<bool>>(dim);

  }

  int get height => dim;

  int get getWidth => dim;

  int get numberOfSteps => _numSteps;

  set incrementSteps(value) => _numSteps = value;

  bool getState(int x, int y) => _model[x][y];
}