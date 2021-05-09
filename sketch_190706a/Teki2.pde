class Teki2 extends Block {

  boolean isLanding;
  int jumpingFrames;  


  Teki2(float x, float y) {
    
     super(x, y, 50, 30, color(255,0, 0));
  
  }


  void update() {
    super.update();
        if (pos.y>height) {
      pos.y = -200;
      pos.x =random(-4800,4800);
        }
   vel.x=-7;
    vel.y+=30;
    vel.mult(0.98f);
    vel.limit(10.0f);
    isLanding = false;
    for (Block b : blocks) {
      if (b==this) continue;
      if (isHit(b))
      {
      if (prevPos.y > b.pos.y && pos.y - size.y <= b.pos.y + b.size.y) {
          pos.y = size.y + b.pos.y +b.size.y;
          if(b.pos.x >prevPos.x && pos.x+size.x>=b.pos.x-b.size.x){
        pos.y = 0;
      pos.x =random(-4000,4800);;
        }
         if(b.pos.x <prevPos.x && pos.x-size.x<=b.pos.x+b.size.x){
        pos.y = 0;
      pos.x =random(-4000,4800);;
        }
        } 
       else if ( pos.y + size.y >= b.pos.y - b.size.y) {
          pos.y = -size.y + b.pos.y - b.size.y;
          isLanding = true;   
    }
    if(pos.x-size.x<-4400){
    pos.y = 0;
    pos.x =random(-4000,4800);;
    }
    }
    }
  if(pos.x-size.x<player.pos.x+player.size.x+5&&player.pos.y - player.size.y-5 < pos.y + size.y&&pos.x+size.x>player.pos.x-player.size.x-5&&player.pos.y + player.size.y+5 > pos.y - size.y){
   seen=3;
 }
}
}
