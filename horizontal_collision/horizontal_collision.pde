/* Horizontal collision detection 
*  Red rectangle a is stationary.
*  Left/right arrow keys move green rectangle b
*/

int rwidth = 80;
int rheight = 40;
int rax, ray, rbx, rby;     
int dx = rwidth/4;

color raColor = color(255,0,0,200);
color rbColor = color(0, 255,0,100);

void setup(){
  size(480, 340);
  strokeWeight(2);
  rectMode(CENTER);
  rax = width/2;
  rbx = width*3/4;
  ray = height/2 - rheight/2;
  rby = height/2 - rheight/2;
}

void draw(){
  background(255);
  fill(raColor);
  rect(rax, ray, rwidth, rheight);
  fill(rbColor);
  rect(rbx, rby, rwidth, rheight);
  
  // collision detection
  // left side of rectangle b is rbx - rwidth/2
  // right side of rectangle a is rax + rwidth/2
  // if (left side of b) is less than (right side of a)
  if( (rbx - rwidth/2) < (rax + rwidth/2)
      && (rbx + rwidth/2) > (rax - rwidth/2)){
    println("collision detected");
  }
  else{
    println("no collision");
  }
}

void keyPressed()
{
  if(keyCode == 37){   // left arrow
    rbx -= dx;
  }
  else if(keyCode == 39){  // right arrow
    rbx += dx;
  }
}
