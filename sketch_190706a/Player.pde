class Player extends Block {

  boolean isLanding;
  int jumpingFrames;

  Player(float x, float y) {
     super(x, y, 50, 30, color(0,255, 0));
  }


  void update() {
    super.update();
  float x = mouseX - pos.x - basePos.x;
    if (abs(x) > size.x) vel.x += x< 0 ?-0.2f :0.2f;

    vel.y+=0.5f;
    if (mousePressed) {
   if(mouseButton==LEFT){

      if (isLanding) {
        vel.y -=3.0f;
        jumpingFrames =12;
      }
      if (jumpingFrames-->0) {
        vel.y -=1.0f;
      }else jumpingFrames =0;
   } 
    }

  
    vel.mult(0.98f);
   vel.limit(10.0f);
    if (pos.y>height+300) {
      pos.y = 360;
      pos.x =-4800;
      if(score_f>0){
      score_p=0;
       score_m=0;
      }else{
      score_p=0;
      }
      
    }
    isLanding = false;
    for (Block b : blocks) {
      if (b==this) continue;
      if (isHit(b))
      {
        if(b.col==color(0)){ b.col = color(colorsa*random(255),colorsa*random(255),colorsa*random(255));
          score_p+=100;
        }
        if (prevPos.y > b.pos.y && pos.y - size.y <= b.pos.y + b.size.y) {
          pos.y = size.y + b.pos.y +b.size.y;
          if(b.pos.x >prevPos.x && pos.x+size.x>=b.pos.x-b.size.x){
       vel.x=-vel.x ;
        }
         if(b.pos.x <prevPos.x && pos.x-size.x<=b.pos.x+b.size.x){
       vel.x=-vel.x ;
        }
        } 
       else if ( pos.y + size.y >= b.pos.y - b.size.y) {
          pos.y = -size.y + b.pos.y - b.size.y;
          isLanding = true;
        } 
    }
  }
}
}
