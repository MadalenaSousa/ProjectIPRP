int ns=10;
Star[] star = new Star[ns];
PImage background;
float raio=30;
int soma;

void setup() {
  size(1000, 800);

  //Criação das Estrelas
  for (int i=0; i<ns; i++) {
    star[i] = new Star(random(raio, width-raio), random(raio, height-raio), raio, 8, 8, 255, 255, 255, 0);
  }

  //Carregamento do background
  background = loadImage("Background.png");
}

void draw() {
  //Desenho do background
  imageMode(CORNER);
  image(background, 0, 0, width, height);

  if (soma>=100) { //Se a soma for maior que 100 a função draw só executa o background
    return;
  }

//FALTA-ME ACABAR DE TIRAR PARTES DESTE CÓDIGO PRINCIPAL E USÁ-LO NA CLASSE DO NÍVEL(PLANETS)

  //Estrelas
  for (int i=0; i<ns; i++) {
    if (mousePressed && dist(star[i].x, star[i].y, mouseX, mouseY)<=star[i].raio) { //Crescem, ficam vermelhas e o número aumenta quando o rato esta premido
      star[i].grow();
      star[i].redgiant();
    }
    soma();
    star[i].colideWall(); //Colisão com as paredes
    star[i].move(); //Movimento
    star[i].desenha(); //Desenha
    for (int j=0; j<ns; j++) { //Colisão entre estrelas
      if (star[i].colide(star[j])) {
        star[i].resolverColisao(star[j]);
      }
    }
  }

  //Texto do número
  textAlign(CENTER, CENTER);
  fill(200);
  textSize(100);
  text(soma(), width/2, height/2);
}