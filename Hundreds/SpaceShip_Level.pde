class SpaceShipLevel {

  //Atributos
  int ns;
  Star[] star;
  Ship[] ship;
  float raio;
  int soma;
  Menu menu;

  //Construtor
  SpaceShipLevel(Menu menu) {
    ns=8;
    star = new Star[ns];
    ship = new Ship[3];
    raio=30;
    soma=0;
    this.menu = menu;
  }

  void startLevel() {
    for (int i=0; i<ns; i++) {
      star[i] = new Star(); //criação/reset das estrelas
    }
    for (int i=0; i<ship.length; i++) {
      ship[i] = new Ship((i+1)*width/4);
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
        if (ship[z].colide(star[i])) { //se o planeta e a estrela colidirem
          if (star[i].isPressed()) { //se o rato estiver sobre a estrela
            println("Perdeu!"); //o jogador perde
            menu.selected = Menu.LOST;
          } else {
            solveShipColision(ship[z], star[i]); //caso contrário colidem e o jogo continua
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
  }

  /*void mousePressed() {
    for (int i=0; i<ship.length; i++) {
      if (abs(ship[i].x-mouseX)<=ship[i].rx && abs(ship[i].y-mouseY)<=ship[i].ry) {
        ship[i].press =! ship[i].press;
      }
    }
  }*/
}