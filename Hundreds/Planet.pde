class Planet {

  //Atributos
  float x, y;
  float rplaneta, rorbita;
  color cor;
  float alfa;
  float inc;
  boolean anel;

  //Construtor
  Planet(float rplaneta, float rorbita, color cor, float inc, boolean anel) {
    this.x=rorbita;
    y=height/2;
    this.rplaneta=rplaneta;
    this.rorbita=rorbita;
    this.cor=cor;
    alfa=PI/2;
    this.inc=inc;
    this.anel=anel;
  }

  //Métodos
  
  void anel() {
    if(anel) {
    }
  }

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