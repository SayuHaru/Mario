class Coin {
  PVector pos = new PVector();
  PVector size= new PVector();
  PVector vel = new PVector();
  PVector prevPos = new PVector();
  color col;


  Coin(float x, float y, float w, float h, color col) {
    pos.set(x, y, 0);
    size.set(w/2, h/2, 0);
    this.col= col;
  }
  void update() {
    prevPos.set(pos);
    pos .add(vel);
  }

  void draw() {
     for (int i=0; i<10; i++) {
    fill(col);
    strokeWeight(1);
    stroke(0);
    ellipse(coin_x[i], pos.y, size.x*2, size.y*2);
    stroke(0);
    ellipse(coin_x[i], pos.y, size.x/2, size.y/2);
  if(coin_x[i]-25<player.pos.x+15&&coin_x[i]+25>player.pos.x-15&&player.pos.y-player.size.y<375 &&player.pos.y+player.size.y>325){
  coin_x[i]+=100000;
  score_p+=3000;
  }
  }
  }


  boolean isHit(Coin c) {
    return abs(pos.x - c.pos.x) < abs(size.x+c.size.x)&&abs(pos.y - c.pos.y) < abs(size.y+c.size.y);
  }
}
