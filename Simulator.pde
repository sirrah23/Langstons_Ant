class Simulator {
  
  //board that will contain all the cells
  int[][] board;
  //colors that we will choose from for painting the board
  color[] colors;
  //ant x position
  int ant_x;
  //ant y position
  int ant_y;
  //width, height of board
  int w, h;
  //ant direction
  int dir;
  //current color we are painting with
  int curr_color;
  //steps we take during each move
  int step_size;
  //number of colors that we can choose from for board-painting
  int num_colors;
  
  /**
  *  Langston's Ant simulator
  */
  Simulator(int w, int h, int ant_x, int ant_y, int step_size, int num_colors){
    this.w = w;                  
    this.h = h;                  
    this.board = new int[w][h];   
    this.ant_x = ant_x;           
    this.ant_y = ant_y;           
    this.step_size = step_size;   
    this.dir = 3;                 
    this.num_colors = num_colors;
    this.init_colors(num_colors);
    this.change_color();
  }
  
  /**
  * Each individual step of the Langston's ant simulation
  */
  void step(){
    if(this.board[this.ant_x][this.ant_y] == 0){
       this.turn_right();
    } else {
       this.turn_left();
       this.change_color();
    }
    this.flip();
    this.move();
  }
  
  /**
  * Wrapper to easily run n number of steps
  */
  void steps(int n){
    for(int i = 0; i < n; i++){
       this.step(); 
    }
  }
  
  /**
  * Turn the ant right
  */
  void turn_right(){
    this.dir++;
    if (this.dir > 3){
      this.dir = 0; 
    }
  }
  
  /**
  * Turn the ant left
  */
  void turn_left(){
    this.dir--;
    if (this.dir < 0){
     this.dir = 3; 
    }
  }
  
  /**
  * Move the ant in the direction it is facing
  */
  void move(){
     switch (this.dir){
        case 0:
          this.ant_y += this.step_size; //up
          break;
        case 1:
          this.ant_x += this.step_size; //right
          break;
        case 2:
          this.ant_y -= this.step_size; //down
          break;
        case 3:
          this.ant_x -= this.step_size; //left
          break;
     }
     
     //Wrap around the grid if moved off of edges
     if(this.ant_x < 0){
        this.ant_x = this.w-1; 
     } else if (this.ant_x >= this.w){
        this.ant_x = 0; 
     }
     
     //Wrap around the grid if moved off of edges
     if(this.ant_y < 0){
        this.ant_y = this.h-1; 
     } else if (this.ant_y >= this.h){
        this.ant_y = 0; 
     }
     
  }
  
  /**
  * Draws the current state of the board on a canvas
  */
  void draw_board(){
    background(255);
    for(int x = 0; x < width; x++){
      for(int y = 0; y < height; y++){
        if(this.board[x][y] != 0){
          fill(this.colors[this.board[x][y]]);
          rect(x, y, this.step_size, this.step_size);
        } else {
          fill(255); 
        }
      }
    } 
  }
 
 /**
 * Flips an individual tile on the board on or off
 */
  void flip(){
    if(this.board[ant_x][ant_y] != 0){
      this.board[ant_x][ant_y] = 0;
    } else {
      this.board[ant_x][ant_y] = this.curr_color;
    }
  }
  
  /**
  * Initialize color selection with n random colors
  */
  void init_colors(int n){
     this.colors = new color[n];
     for(int c = 1; c < n; c++){
       this.colors[c] = color(random(255), random(255), random(255));
     }
  }
  
  /**
  * Change the color we are using to paint - changes when ant encounters
  * with a tile that has already been painted
  */
  void change_color(){
     this.curr_color = int(random(1, this.num_colors)); 
  }
}