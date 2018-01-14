class Alien {

  //Atributos
  float x, y;
  float r;
  color cor;
  float velx, vely;

  //Construtor
  Alien(float x, float y, float r) {
    this.x=x;
    this.y=y;
    this.r=r;
    cor=color(#0CEDBE);
    velx=2;
    vely=2;
  }

  //Movimento do Alien
  void move() {
    y=y+vely;
    x=x+velx;
  }

  //Colisão com as paredes  
  void parede() {
    if (x>=width-r || x<=r) {
      velx=-velx;
    }
    if (y>=height-r || y<=r) {
      vely=-vely;
    }
  }

  void desenha() {

    ellipseMode(CENTER);
    strokeWeight(1);
    stroke(0);

    fill(255, 0, 0);
    ellipse(x, y+r/2+20, r/2, r-10);

    fill(cor);
    ellipse(x, y, 2*r, 2*r);

    fill(255);
    ellipse(x-r/2, y, r-10, r-10);
    ellipse(x+r/2, y, r-10, r-10);

    fill(0);
    ellipse(x-r/2, y, r/3, r/3);
    ellipse(x+r/2, y, r/3, r/3);
  }
}