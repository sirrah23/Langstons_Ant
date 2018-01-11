Simulator s;

void setup(){
   fullScreen();
   s = new Simulator(width, height, width/2, height/2, 4, 10); 
}

void draw(){
  s.draw_board();
  s.steps(500);
}