class SpaceShipLevel {

  //Atributos
  int ns;
  Star[] star;
  Ship[] ship;
  Astronauta[] astronauta;
  float raio;
  int soma;
  Menu menu;

  //Construtor
  SpaceShipLevel(Menu menu) {
    ns=8;
    star = new Star[ns];
    ship = new Ship[2];
    astronauta = new Astronauta[2];
    raio=30;
    soma=0;
    this.menu = menu;
  }

  void startLevel() {
    for (int i=0; i<ns; i++) {
      star[i] = new Star(); //criação/reset das estrelas
    }
    for (int i=0; i<ship.length; i++) {
      ship[i] = new Ship((i+1)*width/3); //criação das naves
    }

    for (int i=0; i<astronauta.length; i++) {
      astronauta[i] = new Astronauta(); //criação dos capacetes
    }

    soma=0; //reset da soma
  }

  //Função de somar
  int soma() {

    soma=0;

    for (int i=0; i<ns; i++) {
      soma=soma+star[i].n;
    }

    return soma;
  }

  void solveShipColision(Ship ship, Star star) {

    //colisões entre estrelas e naves
    if (star.x <= ship.x) { 
      star.velx = -abs(star.velx);
    } else {
      star.velx = abs(star.velx);
    }

    if (star.y <= ship.y) {
      star.vely = -abs(star.vely);
    } else {
      star.vely = abs(star.vely);
    }

    //não deixa que as estrelas passem por cima das naves, ao colidir move imediatamente a estrela edesenha-a num sítio onde não esteja a colidir
    star.move(); 
    star.desenha();
  }

  void solveAstronautColision(Astronauta astronauta, Star star) {

    //colisões entre estrelas e capacetes
    if (star.x <= astronauta.x) { 
      star.velx = -abs(star.velx);
    } else {
      star.velx = abs(star.velx);
    }

    if (star.y <= astronauta.y) {
      star.vely = -abs(star.vely);
    } else {
      star.vely = abs(star.vely);
    }

    //não deixa que as estrelas passem por cima dos capacetes, ao colidir move imediatamente a estrela edesenha-a num sítio onde não esteja a colidir
    star.move(); 
    star.desenha();
  }

  void desenha() {

    //soma = 100 -> ganha
    if (soma>=100) { 
      menu.selected = Menu.WON;
    }

    //Estrelas

    //básicos: criação, movimento, etc
    for (int i=0; i<ns; i++) {  
      if (star[i].isPressed()) { //se o rato estiver por cima da estrela
        star[i].grow(); //cresce
        star[i].redgiant(); //fica vermelha
      }
      star[i].colideWall(); //colide com as paredes
      star[i].move(); //move
      star[i].desenha(); //desenha

      //colisão com estrelas
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

      //colisão com as naves
      for (int z=0; z<ship.length; z++) {
        if (ship[z].colide(star[i])) { //se anave e a estrela colidirem
          if (star[i].isPressed()) { //se o rato estiver sobre a estrela
            println("Perdeu!"); //o jogador perde
            menu.selected = Menu.LOST;
          } else {
            solveShipColision(ship[z], star[i]); //caso contrário colidem e o jogo continua
          }
        }
      }

      //colisão com os astronautas
      for (int z=0; z<astronauta.length; z++) {
        if (astronauta[z].colide(star[i])) { //se o capacete e a estrela colidirem
          if (star[i].isPressed()) { //se o rato estiver sobre a estrela
            println("Perdeu!"); //o jogador perde
            menu.selected = Menu.LOST;
          } else {
            solveAstronautColision(astronauta[z], star[i]); //caso contrário colidem e o jogo continua
          }
        }
      }
    }

    //Texto do número
    textAlign(CENTER, CENTER);
    fill(200);
    textSize(100);
    text(soma(), width/2, height/2);

    for (int i=0; i<ship.length; i++) {
      ship[i].desenha();
    }
    for (int i=0; i<astronauta.length; i++) {
      astronauta[i].desenha();
    }
  }
  void mousePressed() {
    for (int i = 0; i<ship.length; i++) {
      ship[i].mousePressed();
    }
    for (int i=0; i<astronauta.length; i++) {
      if (astronauta[i].hit(mouseX, mouseY)) {
        astronauta[i].mover = true; //garante que ao arrastarmos um capacete e passarmos por cima do outro não passamos a arrastar os dois
        astronauta[i].xOffset = astronauta[i].x-mouseX; //Offset vai ser adicionado a mouseX e mouseY, ou seja, as coordenadas do capacete vao ser as coordenadas do rato mais o espaço que ele anda
        astronauta[i].yOffset = astronauta[i].y-mouseY;
      }
    }
  }
}