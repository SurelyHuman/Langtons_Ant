Cell[][] _cellArray;
int[] antLoc;
int antDirection;
int _cellSize = 5;
int _numX, _numY;
int R, G, B, trans;
int changeR, changeG, changeB, changeTrans;
int STEP = 10;


void setup(){
  size(1000, 800);
  //background(0);
  colorMode(RGB, 255, 255, 255);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  restart();
}  

void restart(){
  background(0);
  R = int(random(255)); //changes color with each run
  G = int(random(255));
  B = int(random(255));
  trans = 5;
  changeR = int(random(100)); //sets per run change variable
  changeG = int(random(100));
  changeB = int(random(100));
  changeTrans = int(random(4));
  
  _cellArray = new Cell[_numX][_numY];
  for(int x = 0; x < _numX; x++){
    for(int y = 0; y < _numY; y++){
      Cell newCell = new Cell(x, y);
      _cellArray[x][y] = newCell;
    }  
  }
  antLoc = new int[]{int(random(_numX-1)),int(random(_numY-1))};
  antDirection = int(random(1, 5));
} //<>//

void updateScene(){
  if (_cellArray[antLoc[0]][antLoc[1]].getState() == 0){
    _cellArray[antLoc[0]][antLoc[1]].setState(1);
    //turnLeft();
    turnRight();
  }
  else{
    _cellArray[antLoc[0]][antLoc[1]].setState(0);
    turnLeft();
    //turnRight();
  }
  moveForward();
}

void draw(){
  
  translate(_cellSize/2, _cellSize/2);
  for(int x = 0; x < _numX; x++){
    for(int y = 0; y < _numY; y++){
      _cellArray[x][y].drawMe();
    }
  }
  for(int x = 0; x < _numX; x++){
    for(int y = 0; y < _numY; y++){
      if(_cellArray[x][y].getState() == 1) _cellArray[x][y].setState(2);
    }
  }
  for(int i = 0; i < STEP; i++){
    updateScene();
  }
  println(frameRate);
}

void moveForward(){
  if (antDirection == 1){
    antLoc[0]--;
  }
  if (antDirection == 2){
    antLoc[1]++;
  }
  if (antDirection == 3){
    antLoc[0]++;
  }
  if (antDirection == 4){
    antLoc[1]--;
  }
  
  if(antLoc[1] < 0) antLoc[1] = _numY - 1;
  if(antLoc[0] < 0) antLoc[0] = _numX - 1;
  if(antLoc[1] == _numY) antLoc[1] = 0;
  if(antLoc[0] == _numX) antLoc[0] = 0;
}

void turnLeft(){
  if (antDirection > 1){
    antDirection--;
  } else{
    antDirection = 4;
  }
}


 
void turnRight(){
  if (antDirection < 4){
    antDirection++;
  } else {
    antDirection = 1;
  }
}

void mousePressed(){
  restart();
}