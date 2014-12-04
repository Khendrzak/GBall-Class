GBall[] bouncers = new GBall [100];

void setup(){
 colorMode(HSB);
 size(800,600);
 for(int i = 0; i< bouncers.length; i++){
  bouncers[i] = new GBall();
 }
}

void draw(){
  background(0,0,100);
  for(int i = 0; i< bouncers.length; i++){
  bouncers[i].display();
  bouncers[i].move();
  bouncers[i].bounce();
 }
}

class GBall{
  float sz;
  PVector loc, vel, acc;
  float hue,sat,bright,alpha;
  
  GBall(){
   sz=random(25,50);
   loc = new PVector(random(width),random(height/2));
   vel = new PVector(random(-5,5),0);
   acc = new PVector(0,random(.05,.1));
  }
  GBall(float tempx, float tempsz) {
    sz = tempsz;

    loc = new PVector(tempx, sz);
    vel = new PVector(random(-5,5),0);
    acc = new PVector(0, random(.05,.1));
    hue = random(360);
    sat = 100;
    bright = 100;
    alpha = 70;
  }
  
  void display(){
    fill(random(hue),random(sat),random(bright),random(alpha));
    ellipse(loc.x,loc.y,sz,sz); 
  }
  
  void move(){
   vel.add(acc);
   loc.add(vel);
  }
  
  void bounce(){
    if (loc.y + sz/2 > height) {
      vel.y = -abs(vel.y);
      loc.y = height-sz/2;
    }
    if(loc.x +sz/2>width){
      vel.x=-abs(vel.x);
    }
    if(loc.x-sz/2<0){
      vel.x=abs(vel.x);
    }
  }
}
