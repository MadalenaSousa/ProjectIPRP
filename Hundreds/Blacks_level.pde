class Blacks {
  int ns;
  Star[] star;
  float raio, raiob, xb, yb, xb2, velxb, velyb;
  int soma;
  Menu menu;

  Blacks(Menu menu) {
    ns=3;
    star = new Star[ns];
    raio=30;
    raiob=45;
    xb= 250;
    yb=height/2;
    xb2=750;
    soma=0;
    velxb=8;
    velyb=8;
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

  void Colisaob() {

    for (int i=0; i<ns; i++) {

      float d1 = dist (star[i].x, star[i].y, xb, yb);
      float d2 = dist (star[i].x, star[i].y, xb2, yb); 
      if (d1<=star[i].raio+raiob || d2<=star[i].raio+raiob ) { // Se a distância do centro da estrela ao centro do buraco negro for menor ou igual à soma dos raios:
        star[i].velx = -1*star[i].velx; // muda o sentido do movimento em x das estrela 
        star[i].vely = -1*star[i].vely; // muda o sentido do movimento em y das estrela 
        star[i].raio=30; // o raio volta ao tamanho inicial
        star[i].n=0; // a estrela volta ao valor inicial (0)
        // a cor volta a branco
        star[i].r=255; 
        star[i].g=255;
        star[i].b=255;
      }
    }
  }

  void desenha() {

    if (soma>=100) { 
      menu.selected = Menu.WON;
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
            menu.selected = Menu.LOST;
          } else {
            star[i].resolverColisao(star[j]);
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
    stroke(255);
    ellipse(xb, yb, 2*raiob, 2*raiob);
    ellipse(xb2, yb, 2*raiob, 2*raiob);
  }
}