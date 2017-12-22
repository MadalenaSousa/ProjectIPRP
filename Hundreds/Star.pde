class Star {
  //Atributos
  float x;
  float y;
  float raio;

  float velx;
  float vely;

  color cor;

  int r, g, b, n;

  //Métodos
  Star() { 
    x = random(raio, width-raio);
    y = random(raio, height-raio);
    raio = 30;
    r=255;
    g=255;
    b=255;
    //cor = color(r,g,b);
    velx = 8;
    vely = 8;
    n=0;
  }

  Star(float x, float y, float raio, float velx, float vely, int r, int g, int b, int n) {

    this.x = x;
    this.y = y;
    this.raio = raio;
    this.r=r;
    this.g=g;
    this.b=b;
    //this.cor = color(r,g,b);
    this.velx = velx;
    this.vely = vely;
    this.n=n;
  }

  void move() {

    x=x+velx;
    y=y+vely;
  }

  void colideWall() {
    if (x >= width - raio) { 
      x = width-raio;
      velx = -velx;
    }

    if (x <= raio) {
      x = raio;
      velx = -velx;
    }

    if (y >= height - raio) {
      y = height-raio;
      vely = -vely;
    }

    if (y <= raio) {
      y = raio;
      vely = -vely;
    }
  }

  boolean colide(Star s) {

    return dist(x, y, s.x, s.y) <= raio + s.raio;
  }

  void resolverColisao(Star s) {

    if (x < s.x) {
      velx = -abs(velx);
      s.velx = abs(s.velx);
    } else if(x > s.x) {
      velx = abs(velx);
      s.velx = -abs(s.velx);
    }

    if (y < s.y) {
      vely = -abs(vely);
      s.vely = abs(s.vely);
    } else if(y > s.y) {
      vely = abs(vely);
      s.vely = -abs(s.vely);
    }
  }

  void grow() {
    raio=raio+0.8;
  }

  int redgiant() {
    //map(n,raio,raio+100,0,100);
    if (n<100) {
      n=n+1;
      r=r+3;
      g=g-3;
      b=b-3;
    } else {
      n=100;
      r=255;
      g=0;
      b=0;
    }
    return n;
  }

  void desenha() { 

    ellipseMode(CENTER);
    noStroke();
    fill(r, g, b);
    ellipse(x, y, 2*raio, 2*raio);
  }
}