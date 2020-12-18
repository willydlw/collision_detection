/* Red rectangle a is stationary.
*  Arrow keys move green rectangle b
*/

int rwidth = 80;
int rheight = 40;
int rax, ray, rbx, rby;     
int dy = rheight/4;
int dx = rwidth/4;

color raColor = color(255,0,0,200);
color rbColor = color(0, 255,0,100);

void setup(){
  size(480, 340);
  strokeWeight(2);
  rectMode(CENTER);
  rax = width/2;
  rbx = width/2;
  ray = height/2;
  rby = height*3/4 - rheight/2;
}

void draw(){
  background(255);
  fill(raColor);
  rect(rax, ray, rwidth, rheight);
  fill(rbColor);
  rect(rbx, rby, rwidth, rheight);
  
  /* vertical collision detection
  *  top of rectangle b is rby - rheight/2
  *  bottom of rectangle a is ray + rheight/2
  *
  *  if(top of rectangle b < bottom of rectangle a
  *     and bottom of rectangle b > top of rectangle a)
  *  then there is a collision
  */
  
  /* horizontal collision detection
  * left side of rectangle b is rbx - rwidth/2
  * right side of rectangle a is rax + rwidth/2
  * 
  * if (left side of b) is less than (right side of a) 
  *   and if (right side of b) is greater than (left side of a)
  * then there is a collision
  */
  
  if( (rby - rheight/2) < (ray + rheight/2)
      && (rby + rheight/2) > (ray - rheight/2)
      && (rbx - rwidth/2) < (rax + rwidth/2)
      && (rbx + rwidth/2) > (rax - rwidth/2))
  {
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
  if(keyCode == 38){   // up arrow
    rby -= dy;
  }
  else if(keyCode == 39){  // right arrow
    rbx += dx;
  }
  else if(keyCode == 40){  // down arrow
    rby += dy;
  }
}
