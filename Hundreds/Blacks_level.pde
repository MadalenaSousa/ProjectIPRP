class BlacksLevel {
  
  //Atributos
  PImage blackHole;
  int ns;
  Star[] star;
  float raio, raiob, xb, yb, xb2, x, y;
  int soma;
  Menu menu;
  
  //Construtor
  BlacksLevel(Menu menu) {
    ns=3;
    star = new Star[ns];
    raio=30;
    x=random(raio, width-raio);
    y=random(raio, height-raio);
    raiob=50;
    xb= 250;
    yb=height/2;
    xb2=750;
    soma=0;
    blackHole = loadImage("Buraco Negro.png");
    this.menu=menu;
  }

  void startLevel() {
    for (int i=0; i<ns; i++) {
      star[i] = new Star(); //criação/reset das estrelas
      if (dist(star[i].x, star[i].y, xb, yb)<=raiob+raio || dist(star[i].x, star[i].y, 3*xb, yb)<=raiob+raio) { //caso a estrela seja criada a tocar no buraco negro
        star[i].x=random(raio, width-raio); //recalcula a sua posição
        star[i].y=random(raio, height-raio);
      }
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

  void Colisaob() {
    
    //colisão com os buracos negros
    for (int i=0; i<ns; i++) {

      float d1 = dist (star[i].x, star[i].y, xb, yb);
      float d2 = dist (star[i].x, star[i].y, xb2, yb); 
      
      if (d1<=star[i].raio+raiob || d2<=star[i].raio+raiob ) { //se a distância do centro da estrela ao centro do buraco negro for menor ou igual à soma dos raios:
        star[i].velx = -1*star[i].velx; //muda o sentido do movimento em x das estrela 
        star[i].vely = -1*star[i].vely; //muda o sentido do movimento em y das estrela 
        star[i].raio=30; //raio volta ao tamanho inicial
        star[i].n=0; //estrela volta ao valor inicial (0)
        //cor volta a branco
        star[i].r=255; 
        star[i].g=255;
        star[i].b=255;
      }
    }
  }

  void desenha() {
    
    //soma = 100 -> ganha
    if (soma>=100) { 
      menu.selected = Menu.FINAL;
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
      for (int j=0; j<ns; j++) { //se duas estrelas diferentes colidirem
        if (star[i].colide(star[j]) && i!=j) { //se o rato estiver sobre uma delas
          if (star[i].isPressed() || star[j].isPressed()) {
            println("Perdeu!"); //o jogador perde
            menu.selected = Menu.LOST;
          } else {
            star[i].resolverColisao(star[j]); //caso contrário colidem e o jogo continua
          }
        }
      }
    }

    Colisaob();

    //Texto do número
    textAlign(CENTER, CENTER);
    fill(200);
    textSize(100);
    text(soma(), width/2, height/2);


    //Buraco Negro
    fill(0);
    imageMode(CENTER);
    image(blackHole, xb, yb, 2*raiob, 2*raiob);
    image(blackHole, xb*3, yb, 2*raiob, 2*raiob);
  }
}