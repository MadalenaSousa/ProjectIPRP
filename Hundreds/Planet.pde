class Planet {

  //Atributos
  float x, y;
  float rplaneta, rorbita;
  color cor;
  float alfa;
  float inc;
  boolean ring;

  //Construtor
  Planet(float rplaneta, float rorbita, color cor, float alfa, float inc, boolean ring) {
    this.x=rorbita;
    y=height/2;
    this.rplaneta=rplaneta;
    this.rorbita=rorbita;
    this.cor=cor;
    this.alfa=alfa;
    this.inc=inc;
    this.ring=ring;
  }

  //Métodos
  void move() {
    alfa=alfa+inc;
  }

  boolean colide(Star s) {

    return dist(x, y, s.x, s.y) <= (rplaneta + s.raio); //Verifica se o a distância entre duas bolas é menor que a soma dos seus raios
  }

  void resolverColisao(Star s) {

    if (x < s.x) { //Altera o sentido do movimento, será chamada caso colide seja true
      s.velx = abs(s.velx);
    } else if (x > s.x) {
      s.velx = -abs(s.velx);
    }

    if (y < s.y) {
      s.vely = abs(s.vely);
    } else if (y > s.y) {
      s.vely = -abs(s.vely);
    }
  }

  void desenha() {
    if (ring) {
      stroke(cor-100);
      noFill();
      strokeWeight(5);
      ellipse(x, y, 3*rplaneta, rplaneta/2);
    }

    x=rorbita*sin(alfa);
    y=height/2+rorbita*cos(alfa);

    move();

    ellipseMode(CENTER);
    fill(cor);
    noStroke();
    ellipse(x, y, 2*rplaneta, 2*rplaneta);

    if (ring) {
      stroke(cor-100);
      noFill();
      strokeWeight(5);
      arc(x, y, 3*rplaneta, rplaneta/2, PI/6, PI-PI/6);
    }
  }
}