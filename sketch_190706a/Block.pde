class Block {
  PVector pos = new PVector();
  PVector size= new PVector();
  PVector vel = new PVector();
  PVector prevPos = new PVector();
  color col;

  Block(float x, float y, float w,float h, color col) {
    pos.set(x, y, 0);
    size.set(w/2, h/2,0);
    this.col= col;
  }

  void update() {
    prevPos.set(pos);
   pos .add(vel);
  }

  void draw() {
  fill(col);
  rectMode(CENTER);
    rect(pos.x, pos.y, size.x*2, size.y*2);
}
    

  boolean isHit(Block b) {
    return abs(pos.x - b.pos.x) < abs(size.x+b.size.x)&&abs(pos.y - b.pos.y) < abs(size.y+b.size.y);
  }
}
