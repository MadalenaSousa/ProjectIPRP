class Ship {

  //Atributos
  PImage spaceship;
  float x, y, rx, ry;
  float incY;
  boolean press;
  
  //Construtor
  Ship(float x) {
    rx = 70;
    ry = 80;
    this.x = x;
    y = height-ry;
    incY = 8;
    press = false;
    spaceship = loadImage("Nave Espacial.png");
  }

  void move() {
    if (press) {
      incY = 0;
    } else {
      incY = 5;
    }
    if (y <= -ry) {
      y = height+ry;
    }
    y = y - incY;
  }

  boolean colide(Star s) {
    boolean colide = false;

    if (abs(x-s.x)<=rx && abs(y-s.y)<=ry) {
      colide = true;
    }

    return colide; //verifica se o a distância entre duas bolas é menor que a soma dos seus raios, devolve true se colidir
  }

  void desenha() {

    move();
    //mousePressed();

    //Nave
    imageMode(CENTER);
    image(spaceship, x, y, 2*rx, 2*ry);
  }

  void mousePressed() {
    if (abs(x-mouseX)<=rx && abs(y-mouseY)<=ry) {
      press =! press;
    }
  }
}