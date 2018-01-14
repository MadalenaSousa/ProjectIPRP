class Astronauta {

  //Atributos
  PImage astronauta;
  float x, y, r;
  boolean mover;
  float xOffset, yOffset;

  //Construtor
  Astronauta() {
    r = 60;
    x = random(r, width - r);
    y = random(r, height - r);
    mover = false;
    astronauta = loadImage("Astronauta.png");
  }

  boolean colide(Star s) {
    boolean colide = false;

    if (dist(s.x, s.y, x, y)<=r-10+s.raio) {
      colide = true;
    }

    return colide; //verifica se o a distância entre o capacete e as estrelas é menor que a soma dos seus raios, devolve true se colidir
  }

  void drag() {
    if (hit(mouseX, mouseY) && mover && mousePressed) { //se o rato estiver em cima, pressionado e mover==true
      x=mouseX+xOffset; //coordenadas passam a ter o valor das coordenadas do rato mais o Offset
      y=mouseY+yOffset;
    }
    if (mousePressed==false) {
      mover = false; //ao ter o rato pressionado mover = true e vice versa
    }
  }

  boolean hit (float x1, float y1) {
    boolean hit=false;
    if (dist(x1, y1, x, y)<=r) {
      hit=true;
    }
    return hit; //veirifica se está ou não sobre um ponto(que será mouseX e mouseY)
  }

  void desenha() {
    drag();
    imageMode(CENTER);
    image(astronauta, x, y, 2*r, 2*r);
  }
}