PImage background;
Basic basic = new Basic();

void setup() {
  size(1000, 800);
  
  basic = new Basic();
  
  basic.create();
  
  //Carregamento do background
  background = loadImage("Background.png");
}

void draw() {
  //Desenho do background
  imageMode(CORNER);
  image(background, 0, 0, width, height);
  
  basic.desenha1();

}