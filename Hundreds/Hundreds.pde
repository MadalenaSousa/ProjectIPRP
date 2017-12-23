PImage background;
float r;
Basic basic = new Basic();
float xb, yb;

void setup() {
  size(1000, 800);

  r=80;
  xb=width/5;
  yb=height/2;

  basic = new Basic();

  basic.create();

  //Carregamento do background
  background = loadImage("Background.png");
}

void draw() {
  //Desenho do background
  imageMode(CORNER);
  image(background, 0, 0, width, height);

  if (basic.out()) {
    textAlign(CENTER, CENTER);
    fill(200, 0, 0);
    textSize(100);
    text("HUNDREDS 2.0", width/2, height/5);

    fill(255);
    ellipse(xb, yb, 2*r, 2*r);
    textSize(30);
    text("Level 1", xb, yb+r+20);
  } else {
    basic.desenha1();
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, xb, yb)<=r) {
    basic.out=false;
  }
}