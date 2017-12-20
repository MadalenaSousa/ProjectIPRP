Star star;
PImage background;
float raio=30;

void setup() {
  size(1000,800);

  star = new Star(random(raio,width-raio),random(raio,height-raio),raio,8,8,255,255,255,0);
  background = loadImage("Background.png");
  
}

void draw() {
  imageMode(CORNER);
  image(background,0,0,width,height);
  
  star.desenha();
  if(mousePressed && dist(star.x,star.y,mouseX,mouseY)<=star.raio) {
    star.grow();
    textAlign(CENTER,CENTER);
    fill(200);
    textSize(100);
    text(star.redgiant(),width/2,height/2);
  }
  star.move();
  
}