ArrayList<Block> blocks = new ArrayList <Block>();
ArrayList<Coin> coin = new ArrayList <Coin>();
ArrayList<Fire> fire = new ArrayList <Fire>();
Gall gall;
Player player;
Teki2[] teki2=new Teki2[5];
First_stage first_stage;
First_stage2 first_stage2;
First_stage3 first_stage3;
First_stage4 first_stage4;
First_stage5 first_stage5;
First_stage6 first_stage6;
PVector basePos = new PVector() ;
PImage img1;
PImage img2;
PImage img3;
color col;
int score_f;
int score_p=0;
int score_m=0;
int seen=0;
int t=0;
float[] fire_y= new float[100];
float[] coin_x= new float[10];
float[] coin_x2= new float[10];
float[] teki_x = new float[5];
boolean isLanding;
int colorsa=1;
 boolean isDead;



void setup() {
  size(1200, 700);
  gall= new Gall(4800,100,4800,590);
   //blocks.add(teki2 = new Teki2(-3500, 400));
  blocks.add(player = new Player(-4700, 650));
  blocks.add(first_stage = new First_stage(-4000, 660));
  blocks.add(first_stage2 = new First_stage2(-2500, 660));
  blocks.add(first_stage3 = new First_stage3(-1200, 660));
  blocks.add(first_stage4 = new First_stage4(1400, 660));
  blocks.add(first_stage5 = new First_stage5(4100, 660));
  blocks.add(first_stage6 = new First_stage6(5000, 660));
  for (int i=0; i<6; i++) {
    blocks.add(new Block(random(-2800, -2260),545,40, 80, color(0)));
    blocks.add(new Block(random(-1900, -580), 545, 40, 80, color(0)));
    blocks.add(new Block(random(-100, 2900), 545, 40, 80, color(0)));
    blocks.add(new Block(random(3200, 4500), 545, 40, 80, color(0)));
  }
    for (int i=0; i<16; i++) {
  blocks.add(new Block(random(-4000, 0), random(300, 480), random(80, 220), 15, color(0)));
  blocks.add(new Block(random(0, 4400), random(300, 480), random(80, 220), 15, color(0)));
    }
  for (int i=0; i<5; i++) {
    teki_x[i] =random(-2000,4800);
    blocks.add(teki2[i] = new Teki2(teki_x[i], 400));
    coin_x[i]=random(-4300, 0);
    coin.add(new Coin(coin_x[i], 350, 50, 50, color(255, 255, 0)));
     coin_x2[i]=random(0, 4000);
    coin.add(new Coin(coin_x2[i], 350, 50, 50, color(255, 255, 0)));
  }
   blocks.add(new Block(random(-3450, -3100), 545, 40, 80, color(0)));
   img1 =loadImage("title.png");
   img2 =loadImage("end.png");
   img3 =loadImage("gameover.png");
}

void mousePressed(){
 
  if(mouseButton==RIGHT){
 fire.add(new Fire(player.pos.x+player.size.x,player.pos.y-10 , 20, 20, color(255,0,0)));

  }
if(mouseButton==CENTER){
  score_p=score_p-100;
   blocks.add(new Block(player.pos.x+100, player.pos.y-100, 120, 15, color(colorsa*random(255),colorsa*random(255),colorsa*random(255))));
}
}

void draw() {

  switch(seen){
    case 0:
    background(0);
    textSize(50);
    text("start",300,300);
    image(img1,0,0,width,height);
    println(mouseX);
     println(mouseY);
    if(mouseX>40&&mouseX<460&&mouseY>530&&mouseY<670){
    if(mousePressed){
      seen=1;
    }
    }
    break;
    case 1:
     colorsa=1;
    score_f=score_p+score_m;
  background(120,140,180);
  noStroke();
  fill(0);
  textSize(50);
  text("score", 20, 50);
  text(score_f, 180, 50);
  t++;
   text("time", 860, 50);
  text(400-t/60, 1000, 50);
  fill(0, 0, 255);
  basePos.lerp(new PVector(-player.pos.x + width/2, -player.pos.y + height/1.5, 0), 0.02f);
  translate(basePos.x, basePos.y);
  for (Block b : blocks) { 
    b.update();
    b.draw();
  }
  for (Coin c : coin) { 
    c.update();
    c.draw();
  }
  for (Fire f : fire) { 
    f.update();
    f.draw();
  }
   gall.move();
  gall.display();
if(player.pos.x>4775){
  player.pos.x=4800;
}
break;
case 2:
image(img2,0,0,width,height);
textSize(100);
fill(255);
  text(score_f, 650, 440);
  break;
  case 3:
  textSize(100);
fill(149,23,23);
  image(img3,0,0,width,height);
  text(score_f, 650, 440);
  /*if(mousePressed){
  seen=1;
  colorsa=0;
   player.pos.y = 360;
      player.pos.x =-4800;
  }*/
  break;
  
  }
}
