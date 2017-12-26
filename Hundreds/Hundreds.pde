PImage background, starRed, planet, blackHole2;
float r;
Basic basic = new Basic();
Planets planets = new Planets();
float xb, yb;
PFont f;
int level;

void setup() {
  size(1000, 800);

  r=80;
  xb=width/5;
  yb=height/2;
  f = createFont ("Bauhaus 93", 100, true);

  basic = new Basic();
  planets = new Planets();

  basic.create();
  planets.create();
  
  //Carregamento do background
  background = loadImage("Background.png");
}

void draw() {
  //Desenho do background
  imageMode(CORNER);
  image(background, 0, 0, width, height);
  


}