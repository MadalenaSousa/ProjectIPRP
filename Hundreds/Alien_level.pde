class AlienLevel {
  int ns;
  Star[] star;
  Alien alien;
  float raio,r,x,y;
  int soma;
  Menu menu;

  AlienLevel(Menu menu) {
    ns=9;
    star = new Star[ns];
    r=50;
    x=random(r,width-r);
    y=random(r,height-r);
    raio=30;
    soma=0;
    alien = new Alien(x,y, r,color(0,255,0));

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

 void Colisao() {

      for (int i=0; i<ns; i++) {
        if (dist(star[i].x, star[i].y, alien.x, alien.y)<=star[i].raio+alien.r) {
         star[i].raio=0;
         alien.r++; // AINDA NÃO ESTÁ BEM ESTA CENA ( o objetivo era o ET aumentar sempre que comer a estrela
       // ns=ns-1;
      }
    }
  }

  void desenha() {

    if (soma>=100) { 
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
        if (star[i].colide(star[j]) && i!=j) {
          if (star[i].isPressed() || star[j].isPressed()) {
            println("Perdeu!");
            menu.selected = Menu.MENU;
          } else {
            star[i].resolverColisao(star[j]);
          }
        }
      }
    }

    Colisao();

    //Texto do número
    textAlign(CENTER, CENTER);
    fill(200);
    textSize(100);
    text(soma(), width/2, height/2);


    //Alien
    alien.move();
    alien.parede();
    alien.desenha();
  }
}