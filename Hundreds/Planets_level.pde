class Planets {
  int ns, np;
  Star[] star;
  Planet planet;
  float raio;
  int soma;
  Menu menu;

  Planets(Menu menu) {
    ns=8;
    np=8;
    star = new Star[ns];
    planet = new Planet();
    raio=30;
    soma=0;
    this.menu=menu;
  }

  void startLevel() {
    for (int i=0; i<ns; i++) {
      star[i] = new Star(random(raio, width-raio), random(raio, height-raio), raio, 8, 8, 255, 255, 255, 0);
    }

    soma=0;
  }

  //Função de somar
  int soma() {

    soma=0;

    for (int i=0; i<ns; i++) {
      soma=soma+star[i].n;
    }

    return soma;
  }

  void desenha() {

    if (soma==100) { //Se a soma for maior que 100 é apresentado o menu
      menu.selected = Menu.MENU;
    }

    //Estrelas
    for (int i=0; i<ns; i++) {
      if (star[i].isPressed()) { //Crescem, ficam vermelhas e o número aumenta quando o rato esta por cima
        star[i].grow();
        star[i].redgiant();
      }
      star[i].colideWall(); //Colisão com as paredes
      star[i].move(); //Movimento
      star[i].desenha(); //Desenha

      for (int j=0; j<ns; j++) { //Colisão entre estrelas
        if (star[i].colide(star[j]) && i != j) {
          if (star[i].isPressed() || star[j].isPressed()) {
            menu.selected = Menu.MENU;
          } else {
            star[i].resolverColisao(star[j]);
          }
        }
      }
    
    planet.desenha();
  }
  //Texto do número
  textAlign(CENTER, CENTER);
  fill(200);
  textSize(100);
  text(soma(), width/2, height/2);
}
}