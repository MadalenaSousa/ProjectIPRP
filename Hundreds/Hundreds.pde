Star star;
PImage background;

void setup() {
  size(1000,1000);

  star = new Star();
  background = loadImage("Background.png");
  
}

void draw() {
  imageMode(CORNER);
  image(background,0,0,width,height);
  
  star.desenha();
  if(mousePressed) {
    star.grow();
  }
  star.redgiant();
  star.move();
  
}