/* Red rectangle is stationary.
*  Arrow keys move green rectangle 
*/

// status messages
PFont pf;
String msgColl = "Collision Detected";
String msgNoColl = "No Collision";

// rectangle attributes
int rwidth = 80;
int rheight = 40;
int redx, redy, greenx, greeny;     
int dy = rheight/4;
int dx = rwidth/4;

color redColor = color(255,0,0,200);
color greenColor = color(0, 255,0,100);


void setup(){
  size(320, 240);
  
  // window title
  surface.setTitle("Rectangle Collision");
  surface.setResizable(true);
  
  pf = createFont("Arial",16,true);    // Arial, 16 point, anti-aliasing on
  
  // initialize rectangle attributes and start location
  rectMode(CENTER);
  redx = width/2;
  greenx = width/2;
  redy = height/4 - rheight/2;
  greeny = height*3/4 - rheight/2;
}

void draw(){
  background(255);
  
  fill(redColor);
  rect(redx, redy, rwidth, rheight);
  fill(greenColor);
  rect(greenx, greeny, rwidth, rheight);
  
  // font size and color for collision message
  textFont(pf,16);
  fill(0);
  
  
  /* vertical collision detection
  *  top of rectangle b is greeny - rheight/2
  *  bottom of rectangle a is redy + rheight/2
  *
  *  if(top of rectangle b < bottom of rectangle a
  *     and bottom of rectangle b > top of rectangle a)
  *  then there is a collision
  */
  
  /* horizontal collision detection
  * left side of rectangle b is greenx - rwidth/2
  * right side of rectangle a is redx + rwidth/2
  * 
  * if (left side of b) is less than (right side of a) 
  *   and if (right side of b) is greater than (left side of a)
  * then there is a collision
  */
  
  if( (greeny - rheight/2) <= (redy + rheight/2)
      && (greeny + rheight/2) >= (redy - rheight/2)
      && (greenx - rwidth/2) <= (redx + rwidth/2)
      && (greenx + rwidth/2) >= (redx - rwidth/2))
  {
    text(msgColl, width/3, height*7/8);
  }
  else{
    text(msgNoColl, width/3, height*7/8);
  }
}

void keyPressed()
{
  if(key == 'f'){
    saveFrame("coll-#####.png");
  }
  
  if(keyCode == 37){   // left arrow
    greenx -= dx;
  }
  if(keyCode == 38){   // up arrow
    greeny -= dy;
  }
  else if(keyCode == 39){  // right arrow
    greenx += dx;
  }
  else if(keyCode == 40){  // down arrow
    greeny += dy;
  }
}
