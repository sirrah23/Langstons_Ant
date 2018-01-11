Simulator s;

void setup(){
   size(1000, 1000);
   s = new Simulator(width, height, width/2, height/2, 4, 10); 
}

void draw(){
  s.draw_board();
  s.steps(500);
}