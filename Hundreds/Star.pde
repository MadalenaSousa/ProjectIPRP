class Star {
  //Atributos
  float x;
  float y;
  float raio;

  float velx;
  float vely;

  color cor;
  
  //Métodos
  Star() { 
    x = random(raio,width-raio);
    y = random(raio,height-raio);
    raio = 50;
    cor = color(255);
    velx = 8;
    vely = 8;
  }

  Star(float x, float y, float raio, color cor, float velx, float vely) {

    this.x = x;
    this.y = y;
    this.raio = raio;
    this.cor = color(cor);
    this.velx = velx;
    this.vely = vely;
  }

  void move() {

    x = x + velx;
    y = y + vely;

    if (x >= width - raio) { 
      x = width-raio;
      velx = velx*(-1);
    }

    if (x <= raio) {
      x = raio;
      velx = velx*(-1);
    }

    if (y >= height - raio) {
      y = height-raio;
      vely = vely*(-1);
    }

    if (y <= raio) {
      y = raio;
      vely = vely*(-1);
    }
  }

  boolean colide(Star c) {

    return dist(x, y, c.x, c.y) <= raio + c.raio;
  }

  void resolverColisao(Star c) {

    if (x < c.x) {
      velx = -abs(velx);
      c.velx = abs(c.velx);
    } else {
      velx = abs(velx);
      c.velx = -abs(c.velx);
    }

    if (y < c.y) {
      vely = -abs(vely);
      c.vely = abs(c.vely);
    } else {
      vely = abs(vely);
      c.vely = -abs(c.vely);
    }
  }

  void desenha() { 

    ellipseMode(CENTER);
    noStroke();
    fill(cor);
    ellipse(x, y, 2*raio, 2*raio);
  }
}