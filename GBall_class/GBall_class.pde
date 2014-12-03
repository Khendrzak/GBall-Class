GBall[] bouncers = new GBall [100];

void setup(){
 size(800,600);
 for(int i = 0; i< bouncers.length; i++){
  bouncers[i] = new GBall();
 }
}

void draw(){
  background(0);
  for(int i = 0; i< bouncers.length; i++){
  bouncers[i].display();
  bouncers[i].move();
  bouncers[i].bounce();
 }
}

class GBall{
  float sz;
  PVector loc, vel, acc;
  
  GBall(){
   sz=random(25,50);
   loc = new PVector(random(width),random(height/2));
   vel = new PVector();
   acc = new PVector(0,random(.01,.5));
  }
  
  void display(){
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
  }
}
