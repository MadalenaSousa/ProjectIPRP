class BasicLevel {

  //Atributos
  int ns;
  Star[] star;
  float raio;
  int soma;
  Menu menu;

  //Construtor
  BasicLevel(Menu menu) {
    ns=8;
    star = new Star[ns];
    raio=30;
    soma=0;
    this.menu = menu;
  }

  void startLevel() {
    for (int i=0; i<ns; i++) {
      star[i] = new Star(); //criação/reset das estrelas
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
            star[i].resolverColisao(star[j]); //caso contrária colidem e o jogo continua
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