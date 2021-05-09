class Gall {
 float y2;
  float x1;
  float y1;
  float x2;
  float f_speed=5;
  color col;

  Gall(float g_x1, float g_y1, float g_x2, float g_y2) {
    x1=g_x1;
     x2=g_x2;
       y1=g_y1;
     y2=g_y2;
  }


void move() {
  }
  void display() {
    strokeWeight(10);
    stroke(0);
    line(x1,100,x2,y2);
    fill(255,0,0);
    text(("goal"),x2-50,y2+50);
    strokeWeight(1);
    triangle(x1,y1,x1,y1+50,x1+50,y1+25);
    if(player.pos.x>4775){
  player.pos.x=4800;
}
    if(player.pos.x==4800){
      y1=y1+f_speed;
      if(y1>530){
   f_speed=0.01;
      }
      if(y1>536){
           score_f=score_f+400000/(t/60);
           seen=2;
    }
    }
  }

}
