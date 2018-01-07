class Planet {

  //Atributos
  float x, y;
  float rplaneta, rorbita;
  color cor;
  float alfa;
  float inc;

  //Construtor1
  Planet() {
    x=0;
    y=height/2;
    rplaneta=50;
    rorbita=height/2;
    cor=color(0, 0, 255);  
    alfa=0;
    inc=TWO_PI/1000;
  }

  //Construtor2
  Planet(float rplaneta, float rorbita, color cor, float inc) {
    this.x=rorbita;
    y=height/2;
    this.rplaneta=rplaneta;
    this.rorbita=rorbita;
    this.cor=cor;
    alfa=PI/2;
    this.inc=inc;
  }

  //Métodos

  void move() {
    alfa=alfa+inc;
  }

  boolean colide(Star s) {

    return dist(x, y, s.x, s.y) <= (rplaneta + s.raio); //Verifica se o a distância entre duas bolas é menor que a soma dos seus raios
  }

  void desenha() {

    x=rorbita*sin(alfa);
    y=height/2+rorbita*cos(alfa);

    move();

    ellipseMode(CENTER);
    fill(cor);
    noStroke();
    ellipse(x, y, 2*rplaneta, 2*rplaneta);
  }
}