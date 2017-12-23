class Basic {
  int ns;
  Star[] star;
  float raio;
  int soma;
  boolean out;

  Basic() {
    ns=5;
    star = new Star[ns];
    raio=30;
    soma=0;
    out=true;
  }

  Basic(int ns, Star[] star, float raio, int soma, boolean out) {
    this.ns=ns;
    this.star=star;
    this.raio=raio;
    this.soma=soma;
    this.out=out;
  }

  void create() {
    for (int i=0; i<ns; i++) {
      star[i] = new Star(random(raio, width-raio), random(raio, height-raio), raio, 8, 8, 255, 255, 255, 0);
    }
  }

  //Função de somar
  int soma() {

    soma=0;

    for (int i=0; i<ns; i++) {
      soma=soma+star[i].n;
    }

    return soma;
  }

  boolean out(){
   return out;
   
   }

  void desenha1() {

    if (soma==100) { //Se a soma for maior que 100 a função draw só executa o background
      out=true;
      /*background(0);
       textAlign(CENTER, CENTER);
       fill(200);
       textSize(100);
       text("You Won!", width/2, height/2);*/
    }

    //Estrelas
    for (int i=0; i<ns; i++) {
      if (/*mousePressed &&*/ dist(star[i].x, star[i].y, mouseX, mouseY)<=star[i].raio) { //Crescem, ficam vermelhas e o número aumenta quando o rato esta premido
        star[i].grow();
        star[i].redgiant();
      }
      star[i].colideWall(); //Colisão com as paredes
      star[i].move(); //Movimento
      star[i].desenha(); //Desenha

      for (int j=0; j<ns; j++) { //Colisão entre estrelas
        if (star[i].colide(star[j]) && i!=j) {
          if (/*mousePressed &&*/ dist(star[i].x, star[i].y, mouseX, mouseY)<=star[i].raio) {
            out=true;
            return;
          } else {
            star[i].resolverColisao(star[j]);
          }
        }
      }
    }
    //Texto do número
    textAlign(CENTER, CENTER);
    fill(200);
    textSize(100);
    text(soma(), width/2, height/2);
  }
}