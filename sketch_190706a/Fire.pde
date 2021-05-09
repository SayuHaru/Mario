class Fire {
  PVector pos = new PVector();
  PVector size= new PVector();
  PVector vel = new PVector();
  PVector prevPos = new PVector();
  color col;
  float speed=1;


  Fire(float x, float y, float w, float h, color col) {
    pos.set(x, y, 0);
    size.set(w/2, h/2, 0);
    this.col= col;
  }
  void update() {
    prevPos.set(pos);
    pos .add(vel);
  }

  void draw() {
     for (int i=0; i<100; i++) {
       
    fill(col);
    strokeWeight(1);
    noStroke();
    vel.x=vel.x+speed/100;
    vel.y=vel.y+(cos(vel.x)/13);
    ellipse(pos.x, pos.y, size.x*2, size.y*2);
  }
  
/* if(pos.x+size.x>teki2.pos.x+teki2.size.x){
    teki2.pos.y=-1000;
  }*/
 for (int i=0; i<5; i++) {
   if(pos.x+size.x>teki2[i].pos.x-teki2[i].size.x&&pos.x-size.x<teki2[i].pos.x+teki2[i].size.x&&teki2[i].pos.y - teki2[i].size.y < pos.y + size.y&&teki2[i].pos.y + teki2[i].size.y > pos.y - size.y){
   teki2[i]. pos.y = -500;
      teki2[i].pos.x =random(-4000,4700);
      pos.y = 2000;
      pos.x =random(-4400,4800);
  score_p=score_p+700;
   //println(teki2.pos[i].x);
   
   }
   }
   if(pos.x>player.pos.x+player.size.x+400){
   pos.y = 2000;
      pos.x =random(-4400,4800);
   }
 }
 


  boolean isHit(Fire f) {
    return abs(pos.x - f.pos.x) < abs(size.x+f.size.x)&&abs(pos.y - f.pos.y) < abs(size.y+f.size.y);
  }
}
