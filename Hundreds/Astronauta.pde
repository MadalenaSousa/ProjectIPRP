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

    if (dist(s.x, s.y, x, y)<=r+15) {
      colide = true;
    }

    return colide;
  }

  void drag() {
    if (hit(mouseX, mouseY)&& mover && mousePressed) {
      x=mouseX+xOffset;
      y=mouseY+yOffset;
    }
    if (mousePressed==false) {
      mover = false;
    }
  }

  boolean hit (float x1, float y1) {
    boolean hit=false;
    if (dist(x1, y1, x, y)<=r) {
      hit=true;
    }
    return hit;
  }

  void desenha() {
    drag();
    imageMode(CENTER);
    image(astronauta, x, y, 2*r, 2*r);
  }
}