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
    if (press) { //se estiver pressionado pára
      incY = 0;
    } else {
      incY = 5;
    }
    if (y <= -ry) { //ao chegar ao cimo da janela volta para baixo
      y = height+ry;
    }
    y = y - incY; //move
  }

  boolean colide(Star s) {
    boolean colide = false;

    if (abs(x-s.x)<=rx-40+s.raio && abs(y-s.y)<=ry-5+s.raio) { //tiveram de ser somados aos valores dos raios certos valores para que as colisões fossem o mais reais possíveis, devido às formas irregulares das imagens
      colide = true;
    }

    return colide; //verifica se o a distância entre a nave e as estrelas é menor que a soma dos seus raios, devolve true se colidir
  }

  void desenha() {

    move();
    imageMode(CENTER);
    image(spaceship, x, y, 2*rx, 2*ry);
  }

  void mousePressed() {
    if (abs(x-mouseX)<=rx && abs(y-mouseY)<=ry) {
      press =! press; //se o rato foi pressionado sobre a nave ou não
    }
  }
}