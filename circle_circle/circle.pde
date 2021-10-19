// circle position controlled by mouse location
float mcx = 0;
float mcy = 0;
float mcr = 30;

// stationary circle
float scx, scy, scr;

// distance between center points
float distx, disty;

void setup(){
  size(480,320);
  noStroke();
  scx = width/2;
  scy = height/2;
  scr = 50;
}

void draw(){
  background(255);
  
  mcx = mouseX;
  mcy = mouseY;
  
  distx = scx - mcx;
  disty = scy - mcy;
  if(sqrt(distx*distx + disty*disty) < (scr + mcr)){
    fill(0,0,0,100);    
  }
  else{
    fill(0,200,100,100);
  }
  ellipse(mcx,mcy,mcr*2,mcr*2);
  fill(217,22,240,100);
  ellipse(scx,scy,scr*2,scr*2);
}
