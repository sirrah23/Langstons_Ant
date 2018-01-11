Simulator s;

void setup(){
   size(400, 400);
   s = new Simulator(width, height, width/2, height/2); 
}

void draw(){
  background(255);
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      if(s.board[x][y] == 1){
        fill(0);
        rect(x, y, 1, 1);
      }
    }
  }
  for(int i = 0; i < 1000; i++)
    s.step();
}