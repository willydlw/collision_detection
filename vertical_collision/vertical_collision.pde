/* Red rectangle a is stationary.
*  Up/down arrow key moves green rectangle b
*/

int rwidth = 80;
int rheight = 40;
int rax, ray, rbx, rby;     
int dy = rheight/4;

color raColor = color(255,0,0,200);
color rbColor = color(0, 255,0,100);

void setup(){
  size(480, 340);
  strokeWeight(2);
  rectMode(CENTER);
  rax = width/2;
  rbx = width/2;
  ray = height/4 - rheight/2;
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
  
  if( (rby - rheight/2) < (ray + rheight/2)
      && (rby + rheight/2) > (ray - rheight/2)){
    println("collision detected");
  }
}

void keyPressed()
{
  if(key == 'f'){
    saveFrame("vert-####.png");
  }
  if(keyCode == 38){   // up arrow
    rby -= dy;
  }
  else if(keyCode == 40){  // down arrow
    rby += dy;
  }
}
