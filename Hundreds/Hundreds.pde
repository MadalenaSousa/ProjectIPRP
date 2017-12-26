PImage background, starRed, planet, blackHole2;
float r;
Basic basic = new Basic();
Planets planets = new Planets();
Blacks blacks = new Blacks();
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
  blacks = new Blacks();

  basic.create();
  planets.create();
  blacks.create();

  //Carregamento do background
  background = loadImage("Background.png");
  starRed =  loadImage("StarRed.png");
  planet = loadImage("Terra.png");
  blackHole2 = loadImage("Buraco Negro2.png");
}

void draw() {
  //Desenho do background
  imageMode(CORNER);
  image(background, 0, 0, width, height);

  if (basic.out()) {
    textAlign(CENTER, CENTER);
    fill(200, 0, 255);
    textFont(f, 100);
    text("HUNDREDS 2.0", width/2, height/5);

    fill(255);
    //ellipse(xb, yb, 2*r, 2*r);
    //filter(BLUR,5);
    imageMode(CENTER);
    image(starRed, xb, yb, 2*r+40, 2*r+40);
    textSize(30);
    text("Level 1", xb, yb+r+20);

    filter(BLUR, 0);

    imageMode(CENTER);
    image(planet, 2*xb, yb, 2*r, 2*r);
    fill(255);
    text("Level 2", 2*xb, yb+r+20);

    fill(200);
    imageMode(CENTER);
    image(blackHole2, 3*xb, yb, 2*r, 2*r);
    fill(255);
    text("Level 3", 3*xb, yb+r+20);

    text("Level 4", 4*xb, yb+r+20);
  } else if (level==1) {
    basic.desenha();
  } else if (level==2) {
    planets.desenha();
  } else if (level==3) {
    blacks.desenha();
  } else if (level==4) {
  
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, xb, yb)<=r) {
    level=1;
    basic.out=false;
  }  
  if (dist(mouseX, mouseY, 2*xb, yb)<=r) {
    level=2;
    basic.out=false;
  }  
  if (dist(mouseX, mouseY, 3*xb, yb)<=r) {
    level=3;
    basic.out=false;
  }  
  if (dist(mouseX, mouseY, 4*xb, yb)<=r) {
    level=4;
    basic.out=false;
  }
}