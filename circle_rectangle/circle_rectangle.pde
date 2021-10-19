/* Red rectangle is stationary.
*  Arrow keys move green circle
*/

// status messages
PFont pf;
String msgColl = "Collision Detected";
String msgNoColl = "No Collision";

// rectangle attributes
int rwidth = 80;
int rheight = 40;
int redx, redy;     
int dy = rheight/4;
int dx = rwidth/4;

// circle attributes
int gradius = 10;
int greenx, greeny;

color redColor = color(255,0,0,200);
color greenColor = color(0, 255,0,100);


void setup(){
  size(320, 240);
  
  // window title
  surface.setTitle("Circle Rectangle Collision");
  surface.setResizable(true);
  
  PFont.list();
  
  pf = createFont("Arial",16,true);    // Arial, 16 point, anti-aliasing on
  
  // initialize rectangle attributes and start location
  redx = width/2 - rwidth/2;
  redy = height/4 - rheight/2;
  
  // initialize circle attributes and start location
  greenx = width/2;
  greeny = height*3/4 - rheight/2;
  
  noStroke();
  
}

void draw(){
  background(255);
  
  fill(redColor);
  rect(redx, redy, rwidth, rheight);
  fill(greenColor);
  ellipse(greenx, greeny, gradius*2, gradius*2);
  
  // font size and color for collision message
  textFont(pf,16);
  fill(0);
  
  boolean collision = circleRectCollision(greenx, greeny, gradius, redx, redy, rwidth, rheight);
  
  // collision?
  if(collision)
  {
    text(msgColl, width/3, height*7/8);
  }
  else{
    text(msgNoColl, width/3, height*7/8);
  }
}

boolean circleRectCollision(float cx, float cy, float radius, float rx, float ry,
float rw, float rh)
{
  float xclosest, yclosest, dx, dy, distance;
  if(cx < rx){    // left edge
    xclosest = rx;
  }
  else if(cx > rx + rw){  // right edge
    xclosest = rx + rw;
  }
  else{
    xclosest = cx;
  }
  
  if(cy < ry){  // top edge
    yclosest = ry;
  }
  else if(cy > ry + rh){    // bottom edge
    yclosest = ry + rh;
  }
  else{
    yclosest = cy;
  }
  
  dx = cx - xclosest;
  dy = cy - yclosest;
  distance = sqrt(dx*dx + dy * dy);
  if(distance <= radius){
    return true;
  }
  else{
    return false;
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
