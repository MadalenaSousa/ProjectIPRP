PImage background;
Planets planets = new Planets();

void setup() {
  size(1000, 800);
  
  planets = new Planets();
  
  planets.create();
  
  //Carregamento do background
  background = loadImage("Background.png");
}

void draw() {
  //Desenho do background
  imageMode(CORNER);
  image(background, 0, 0, width, height);
  
  planets.desenha1();

}