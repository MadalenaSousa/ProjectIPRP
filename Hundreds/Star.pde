class Star {
  
  //Atributos
  float x;
  float y;
  float raio;
  float velx;
  float vely;
  color cor;
  int r, g, b, n;

  //Construtor
  Star() { 
    x = random(raio, width-raio);
    y = random(raio, height-raio);
    raio = 30;
    r=255;
    g=255;
    b=255;
    velx = 8;
    vely = 8;
    n=0;
  }

  void move() { //incrementa as cordenadas da estrela

    x=x+velx;
    y=y+vely;
  }

  void colideWall() { //muda o sentido do movimento ao colidir com as paredes
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

  boolean isPressed() {
    return dist(this.x, this.y, mouseX, mouseY) <= this.raio; //verifica se o a distância entre a estrela e o rato é menor ou igual que o seu raio
  }

  boolean colide(Star s) {

    return dist(x, y, s.x, s.y) <= (raio + s.raio); //verifica se o a distância entre duas bolas é menor que a soma dos seus raios
  }

  void resolverColisao(Star s) {

    if (x < s.x) { //altera o sentido do movimento, será chamada caso colide seja true
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
    raio=raio+0.8; //aumenta o raio
  }

  int redgiant() {
    if (n<100) { //enquanto o número for menor que 100, o número cresce e o parametro red aumenta e os outros diminuem
      n=n+1;
      r=r+3;
      g=g-3;
      b=b-3;
    } else { //quando o valor de n for 100 a estrela está totalmente vermelha
      n=100;
      r=255;
      g=0;
      b=0;
    }
    return n; //devolve o valor do número para depois ser escrito
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