class PlanetsLevel {

  //Atributos
  int ns, np;
  Star[] star;
  Planet[] planet;
  float raio;
  int soma;
  Menu menu;

  //Construtor
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
      star[i] = new Star(); //criação/reset das estrelas
    }

    //criação de cada planeta e do sol com as suas características especificas
    planet[0] = new Planet(100, 0, color(255, 255, 0), PI/2, 0, false); //Sol
    planet[1] = new Planet(30, 1.5*width/9, color(#AA9999), random(PI/4, 3*PI/4), TWO_PI/50, false);
    planet[2] = new Planet(40, 2.5*width/9, color(#DE4310), random(PI/4, 3*PI/4), TWO_PI/100, false);
    planet[3] = new Planet(45, 3.5*width/9, color(#16A1F5), random(PI/4, 3*PI/4), TWO_PI/200, false);
    planet[4] = new Planet(35, 4.5*width/9, color(#E5AD13), random(PI/4, 3*PI/4), TWO_PI/300, false);
    planet[5] = new Planet(60, 5.5*width/9, color(#DECC9D), random(PI/4, 3*PI/4), TWO_PI/400, true);
    planet[6] = new Planet(50, 6.5*width/9, color(#C69066), random(PI/4, 3*PI/4), TWO_PI/500, false);
    planet[7] = new Planet(45, 7.5*width/9, color(#56D8FA), random(PI/4, 3*PI/4), TWO_PI/600, false);
    planet[8] = new Planet(45, 8.5*width/9, color(#0C4EF0), random(PI/4, 3*PI/4), TWO_PI/700, true);

    soma=0; //reset da soma
  }

  //Função de somar
  int soma() {

    soma=0;

    for (int i=0; i<ns; i++) {
      soma=soma+star[i].n;
      if (soma>=100) {
        soma=100;
      }
    }

    return soma;
  }

  void solvePlanetColision(Planet planet, Star star) {

    //colisões entre estrelas e planetas
    if (star.x <= planet.x) { 
      star.velx = -abs(star.velx);
    } else {
      star.velx = abs(star.velx);
    }

    if (star.y <= planet.y) {
      star.vely = -abs(star.vely);
    } else {
      star.vely = abs(star.vely);
    }

    //não deixa que as estrelas passem por cima dos planetas, ao colidir move imediatamente a estrela edesenha-a num sítio onde não esteja a colidir
    star.move(); 
    star.desenha();
  }

  void desenha() {

    //soma = 100 -> ganha
    if (soma==100) { 
      menu.selected = Menu.WON;
    }

    //desenha os planetas
    for (int i=0; i<np; i++) {
      planet[i].desenha();
    }

    //Estrelas

    //básicos: criação, movimento, etc
    for (int i=0; i<ns; i++) {
      if (star[i].isPressed()) { //se o rato estiver por cima da estrela
        star[i].grow(); //cresce
        star[i].redgiant(); //fica vermelha
      }
      star[i].move(); //move
      star[i].desenha();//desenha
      star[i].colideWall(); //colide com as paredes

      //colisão entre estrelas
      for (int j=0; j<ns; j++) { 
        if (star[i].colide(star[j]) && i != j) { //se duas estrelas diferentes colidirem
          if (star[i].isPressed() || star[j].isPressed()) { //se o rato estiver sobre uma delas
            println("Perdeu!"); //o jogador perde
            menu.selected = Menu.LOST;
          } else {
            star[i].resolverColisao(star[j]); //caso contrário colidem e o jogo continua
          }
        }
      }

      //colisão entre planetas e estrelas
      for (int z=0; z<np; z++) {
        if (planet[z].colide(star[i])) { //se o planeta e a estrela colidirem
          if (star[i].isPressed()) { //se o rato estiver sobre a estrela
            println("Perdeu!"); //o jogador perde
            menu.selected = Menu.LOST;
          } else {
            solvePlanetColision(planet[z], star[i]); //caso contrário colidem e o jogo continua
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