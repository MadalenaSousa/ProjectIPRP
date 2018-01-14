class Ship {

  //Atributos
  PImage spaceship;
  float x, y, rx, ry;
  float incY;
  boolean press;

  Ship(float x) {
    rx = 70;
    ry = 80;
    this.x = x;
    y = height-ry;
    incY = random(3, 5);
    press = false;
    spaceship = loadImage("Nave Espacial.png");
  }

  void move() {
    if (press) {
      incY = 0;
    } else {
      incY = random(3, 5);
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

    //Nave
    imageMode(CENTER);
    image(spaceship, x, y, 2*rx, 2*ry);
  }
}