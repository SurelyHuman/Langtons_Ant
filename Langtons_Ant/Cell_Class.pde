class Cell{
  float x, y;
  int state;
  Cell[] neighbors;
  
  Cell(float ex, float why){
    x = ex * _cellSize;
    y = why * _cellSize;
    state = 0;
  }  
  
  int getState(){
    return state;
  }  
  
  void setState(int sta){
     state = sta;
  }
  
    
  void drawMe(){
    stroke(0);
    //noStroke();
    //strokeWeight(0.25);
    if(state == 1) fill(R, G, B);
    else if(state == 2) fill(G - changeG, B - changeB, R - changeR, trans - changeTrans);
    else fill(0);
    rect(x , y, _cellSize, _cellSize);
  }
}  