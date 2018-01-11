class Simulator {
  
  int[][] board;
  int ant_x;
  int ant_y;
  int w, h;
  int dir;
  
  Simulator(int w, int h, int ant_x, int ant_y){
    this.w = w;                   //width
    this.h = h;                   //height
    this.board = new int[w][h];   //canvas
    this.ant_x = ant_x;           //ant x position
    this.ant_y = ant_y;           //ant y position
    this.dir = 3;                 //ant direction
  }
  
  void step(){
    if(this.board[this.ant_x][this.ant_y] == 0){
       this.turn_right();
    } else {
       this.turn_left();
    }
    this.flip();
    this.move();
  }
  
  void turn_right(){
    this.dir++;
    if (this.dir > 3){
      this.dir = 0; 
    }
  }
  
  void turn_left(){
    this.dir--;
    if (this.dir < 0){
     this.dir = 3; 
    }
  }
  
  void move(){
     switch (this.dir){
        case 0:
          this.ant_y += 1; //up
          break;
        case 1:
          this.ant_x += 1; //right
          break;
        case 2:
          this.ant_y -= 1; //down
          break;
        case 3:
          this.ant_x -= 1; //left
          break;
     }
     
     if(this.ant_x < 0){
        this.ant_x = this.w-1; 
     } else if (this.ant_x >= this.w){
        this.ant_x = 0; 
     }
     
     if(this.ant_y < 0){
        this.ant_y = this.h-1; 
     } else if (this.ant_y >= this.h){
        this.ant_y = 0; 
     }
     
  }
  
  void flip(){
    this.board[ant_x][ant_y] = (this.board[ant_x][ant_y] + 1) % 2;
  }
}