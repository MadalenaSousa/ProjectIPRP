class PlanetsLevel {
  int ns, np;
  Star[] star;
  Planet[] planet;
  float raio;
  int soma;
  Menu menu;

  PlanetsLevel(Menu menu) {
    ns=5;
    np=9;
    star = new Star[ns];
    planet = new Planet[np];
    raio=30;
    soma=0;
    this.menu=menu;
  }

  void startLevel() {
    for (int i=0; i<ns; i++) {
      star[i] = new Star();
    }

    planet[0] = new Planet(100, 0, color(255, 255, 0), PI/2, 0, false); //Sol
    planet[1] = new Planet(30, 1.5*width/9, color(#AA9999), random(PI/4, 3*PI/4), TWO_PI/50, false);
    planet[2] = new Planet(40, 2.5*width/9, color(#DE4310), random(PI/4, 3*PI/4), TWO_PI/100, false);
    planet[3] = new Planet(45, 3.5*width/9, color(#16A1F5), random(PI/4, 3*PI/4), TWO_PI/200, false);
    planet[4] = new Planet(35, 4.5*width/9, color(#E5AD13), random(PI/4, 3*PI/4), TWO_PI/300, false);
    planet[5] = new Planet(60, 5.5*width/9, color(#DECC9D), random(PI/4, 3*PI/4), TWO_PI/400, true);
    planet[6] = new Planet(50, 6.5*width/9, color(#C69066), random(PI/4, 3*PI/4), TWO_PI/500, false);
    planet[7] = new Planet(45, 7.5*width/9, color(#56D8FA), random(PI/4, 3*PI/4), TWO_PI/600, false);
    planet[8] = new Planet(45, 8.5*width/9, color(#0C4EF0), random(PI/4, 3*PI/4), TWO_PI/700, true);

    soma=0;
  }

  void solvePlanetColision(Planet planet, Star star) {
    if (star.x <= planet.x) { //Altera o sentido do movimento
      star.velx = -abs(star.velx);
    } else {
      star.velx = abs(star.velx);
    }

    if (star.y <= planet.y) {
      star.vely = -abs(star.vely);
    } else {
      star.vely = abs(star.vely);
    }

    star.move();
    star.desenha();
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
      menu.selected = Menu.WON;
    }
    
    for(int i=0; i<np; i++) {
      planet[i].desenha();
    }

    //Estrelas
    for (int i=0; i<ns; i++) {
      if (star[i].isPressed()) { //Crescem, ficam vermelhas e o número aumenta quando o rato esta por cima
        star[i].grow();
        star[i].redgiant();
      }
      star[i].move(); //Movimento
      star[i].desenha();//Desenha
      star[i].colideWall(); //Colisão com as paredes

      for (int j=0; j<ns; j++) { //Colisão entre estrelas
        if (star[i].colide(star[j]) && i != j) {
          if (star[i].isPressed() || star[j].isPressed()) {
            println("Perdeu!");
            menu.selected = Menu.LOST;
          } else {
            star[i].resolverColisao(star[j]);
          }
        }
      }

      for (int z=0; z<np; z++) {
        if (planet[z].colide(star[i])) {
          if (star[i].isPressed()) {
            println("Perdeu!");
            menu.selected = Menu.LOST;
          } else {
            solvePlanetColision(planet[z], star[i]);
          }
        }
      }
      //star[i].desenha();
    }


    //Texto do número
    textAlign(CENTER, CENTER);
    fill(200);
    textSize(100);
    text(soma(), width/2, height/2);
  }
}