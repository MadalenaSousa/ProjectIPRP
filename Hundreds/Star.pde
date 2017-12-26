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

  //Construtor1
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

  //Construtor2
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

  void move() { //Incrementa as cordenadas da estrela

    x=x+velx;
    y=y+vely;
  }

  void colideWall() { //Muda o sentido do movimento ao colidir com as paredes
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

    return dist(x, y, s.x, s.y) <= (raio + s.raio); //Verifica se o a distância entre duas bolas é menor que a soma dos seus raios
  }
  
  boolean isPressed() {
    return dist(this.x, this.y, mouseX, mouseY) <= this.raio;
  }

  void resolverColisao(Star s) {

    if (x < s.x) { //Altera o sentido do movimento, será chamada caso colide seja true
      velx = -abs(velx);
      s.velx = abs(s.velx);
    } else if (x > s.x) {
      velx = abs(velx);
      s.velx = -abs(s.velx);
    }

    if (y < s.y) {
      vely = -abs(vely);
      s.vely = abs(s.vely);
    } else if (y > s.y) {
      vely = abs(vely);
      s.vely = -abs(s.vely);
    }
  }

  void grow() {
    raio=raio+0.8; //Aumenta o raio
  }

  int redgiant() {
    //map(n,raio,raio+100,0,100);
    if (n<100) { //Enquanto o número for menor que 100, o número cresce e o parametro red aumenta
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
    return n; //Devolve o valor do número para depois ser escrito
  }

  void desenha() { 

    ellipseMode(CENTER);
    noStroke();
    fill(r, g, b);
    ellipse(x, y, 2*raio, 2*raio);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(20);
    text(n, x, y);
  }
}