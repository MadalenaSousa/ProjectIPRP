int ns=10;
Star[] star = new Star[ns];
PImage background;
float raio=30;
int soma=0;

void setup() {
  size(1000, 800);

  for (int i=0; i<ns; i++) {
    star[i] = new Star(random(raio, width-raio), random(raio, height-raio), raio, 8, 8, 255, 255, 255, 0);
  }

  background = loadImage("Background.png");
}

void draw() {
  imageMode(CORNER);
  image(background, 0, 0, width, height);

  for (int i=0; i<ns; i++) {
    if (mousePressed && dist(star[i].x, star[i].y, mouseX, mouseY)<=star[i].raio) {
      star[i].grow();
      star[i].redgiant();
      soma();
    }
    for(int j=0; j<ns; j++) {
      if(star[i].colide(star[j])){
        star[i].resolverColisao(star[j]);
      }
    }
    star[i].desenha();
    star[i].colideWall();
    star[i].move();
  }
  
  //println(star[2].velx);
  //println(star[2].vely);
  println(star[2].x);
  println(star[2].y);
  
  textAlign(CENTER, CENTER);
  fill(200);
  textSize(100);
  text(soma, width/2, height/2);
  
}

int soma() {
  
  if(soma<100){
    soma=soma+1;
  }else{
    soma=100;
  }

  return soma;
}