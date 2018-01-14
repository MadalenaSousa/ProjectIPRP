class AlienLevel {

  int ns;
  ArrayList<Star> star;
  Alien alien;
  float raio,r,x,y;
  int soma;
  Menu menu;

  AlienLevel(Menu menu) {
    ns=9;
    star = new ArrayList<Star>();
    r=50;
    x=random(r,width-r);
    y=random(r,height-r);
    raio=30;
    soma=0;
    alien = new Alien(x,y,r);

    this.menu=menu;
  }

  void startLevel() {
    alien.r=r;
    star.clear(); 
    //Adicionar estrelas
    for (int i=0; i<ns; i++) {
      star.add(new Star());
    }
    soma=0;
  }

  //Função de somar
  int soma() {

    soma=0;

    for (Star s : star) {
      soma=soma+s.n;
    }

    return soma;
  }

 void Colisao() {

    for (int i=0; i<star.size(); i++) {
      Star s = star.get(i);
      if (dist(s.x, s.y, alien.x, alien.y)<=s.raio+alien.r) { // se houver colisão entre a estrela e o Alien
       star.remove(i);//estrela em causa desaparece
       i--;
       
       alien.r=alien.r+3;//o raio do Alien aumenta     
    }
    // caso o numero de estrelas seja = 0, o jogador perde o nível
     if (star.size()==0) {
            println("Perdeu!");
            menu.selected = Menu.LOST;}
          }
  }

  void desenha() {

    if (soma>=100) { 
      menu.selected = Menu.WON;
    }

    //Estrelas

    for (Star s : star) {
      if (s.isPressed()) { //Crescem, ficam vermelhas e o número aumenta quando o rato esta por cima
        s.grow();
        s.redgiant();
      }
      s.colideWall(); //Colisão com as paredes
      s.move(); //Movimento
      s.desenha(); //Desenha
      
      for (Star s1 : star) { //Colisão entre estrelas
        if (s.colide(s1) && s!=s1) {// se duas estrelas diferentes colidirem
          if (s.isPressed() || s1.isPressed()) { // se o rato estiver sobre uma delas
            println("Perdeu!"); //o jogador perde
            menu.selected = Menu.LOST;
          } else { // caso contrária colidem e o jogo continua
            s.resolverColisao(s1);
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