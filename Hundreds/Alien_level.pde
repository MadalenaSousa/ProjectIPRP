class AlienLevel {

  //Atributos
  int ns;
  ArrayList<Star> star;
  Alien alien;
  float raio, r, x, y;
  int soma;
  Menu menu;

  //Construtor
  AlienLevel(Menu menu) {
    ns=9;
    star = new ArrayList<Star>();
    r=50;
    x=random(r, width-r);
    y=random(r, height-r);
    raio=30;
    soma=0;
    alien = new Alien(x, y, r);
    this.menu=menu;
  }

  void startLevel() {
    alien.r=r; //reset do raio
    star.clear(); //reset das estrelas
    for (int i=0; i<ns; i++) { 
      star.add(new Star()); //adiciona estrelas
    }
    soma=0;//reset dos números
  }

  //Função de somar
  int soma() {

    soma=0;

    for (Star s : star) { //para cada estrela s no arraylist star
      soma=soma+s.n;
      if (soma>=100) {
        soma=100;
      }
    }

    return soma;
  }

  void ComerEstrelas() {

    for (int i=0; i<star.size(); i++) { //executa para o arraylist todo(star.size), mesmo depois do seu tamanho variar
      Star s = star.get(i); //vai buscar(get) todos os elementos(i) do array e testa se
      if (dist(s.x, s.y, alien.x, alien.y)<=s.raio+alien.r) { // há colisão entre a estrela e o Alien
        star.remove(i);// se sim, a estrela em causa desaparece
        i--; // volta a testar o índice onde está porque agora já lá está outra estrela que ainda não foi testada

        alien.r=alien.r+3;//o raio do Alien aumenta
      }
      // caso o numero de estrelas seja = 0, o jogador perde o nível
      if (star.size()==0) {
        println("Perdeu!");
        menu.selected = Menu.LOST;
      }
    }
  }

  void desenha() {

    //soma = 100 -> ganha
    if (soma>=100) { 
      menu.selected = Menu.WON;
    }

    //Estrelas

    //básicos: criação, movimento, etc
    for (Star s : star) { //para cada estrela s no arraylist star
      if (s.isPressed()) { //se o rato tiver por cima
        s.grow(); //cresce
        s.redgiant(); //fica vermelha
      }
      s.colideWall(); //colide com as paredes
      s.move(); //move
      s.desenha(); //desenha

      //colisão com estrelas
      for (Star s1 : star) { //para cada estrela s1 no arraylist star
        if (s.colide(s1) && s!=s1) { //se duas estrelas diferentes colidirem
          if (s.isPressed() || s1.isPressed()) { //se o rato estiver sobre uma delas
            println("Perdeu!"); //o jogador perde
            menu.selected = Menu.LOST;
          } else { //caso contrário colidem e o jogo continua
            s.resolverColisao(s1);
          }
        }
      }
    }

    ComerEstrelas();

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