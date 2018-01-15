PImage background, star, ship, blackHole;
PFont f;
Menu menu;
Alien alien;
Planet planet;

//Níveis
BasicLevel basic;
PlanetsLevel planets;
SpaceShipLevel spaceship;
BlacksLevel blacks;
AlienLevel aliens;

float xb, yb;
float r;
int larg, alt;
int l;

void setup() {
  size(1000, 800);

  //Definição de variáveis
  r=60;
  xb=width/6;
  yb=height/2;
  f = createFont ("Bauhaus 93", 100, true);
  menu = new Menu(Menu.MENU);
  larg = 305;
  alt = 100;

  //Criação dos Níveis
  basic = new BasicLevel(menu);
  planets = new PlanetsLevel(menu);
  spaceship = new SpaceShipLevel(menu);
  aliens = new AlienLevel(menu);
  blacks = new BlacksLevel(menu);


  //Imagens do Menu Principal
  background = loadImage("Background.png");
  star =  loadImage("StarRed.png");
  planet = new Planet(r-10, 2*xb, color(#0C4EF0), PI/2, 0, true);
  ship = loadImage("Nave Espacial.png");
  alien = new Alien(4*xb, yb, r-10);
  blackHole = loadImage("Buraco Negro.png");
}

void draw() {
  //Desenho do background
  imageMode(CENTER);
  image(background, width/2, height/2, width, height);
   
  //If que define o que apresentar com a variavel selected == a determindado menu
   
  //Definição do menu WON
  if (menu.selected == Menu.WON) {
    textAlign(CENTER, CENTER);
    fill(#71DBAC);
    textFont(f, 100);
    text("YOU WON!", width/2, height/5);

    rectMode(CENTER);
    fill(255);
    noStroke();
    rect(width/2, 2.55*height/5, larg, alt, 50);
    rect(width/2, 3.55*height/5, larg, alt, 50);

    fill(0);
    textFont(f, 40);
    text("Next Level", width/2, 2.5*height/5);
    text("Menu", width/2, 3.5*height/5);
  } 

  //Definição do menu LOST  
  else if (menu.selected == Menu.LOST) {
    textAlign(CENTER, CENTER);
    fill(#F7164B);
    textFont(f, 100);
    text("YOU LOST!", width/2, height/5);

    rectMode(CENTER);
    fill(255);
    noStroke();
    rect(width/2, 2.55*height/5, larg, alt, 50);
    rect(width/2, 3.55*height/5, larg, alt, 50);

    fill(0);
    textFont(f, 40);
    text("Restart Level", width/2, 2.5*height/5);
    text("Menu", width/2, 3.5*height/5);
  } 

  //Definição do menu FINAL
  else if (menu.selected == Menu.FINAL) {
    textAlign(CENTER, CENTER);
    fill(#71DBAC);
    textFont(f, 170);
    text("YOU WON!", width/2, height/3);

    rectMode(CENTER);
    fill(255);
    noStroke();
    rect(width/2, 3.55*height/5, larg, alt, 50);
    fill(0);
    textFont(f, 40);
    text("Menu", width/2, 3.5*height/5);
  }

  //Definição do menu MENU (principal)
  else if (menu.selected == Menu.MENU) {
    textAlign(CENTER, CENTER);
    fill(200, 0, 255);
    textFont(f, 100);
    text("HUNDREDS 2.0", width/2, height/5);

    fill(255);
    imageMode(CENTER);
    image(star, xb, yb, 2*r+20, 2*r+20);
    textSize(30);
    text("Level 1", xb, yb+r+20);

    fill(255);
    text("Level 2", 2*xb, yb+r+20);
    planet.desenha();

    fill(255);
    imageMode(CENTER);
    image(ship, 3*xb, yb, 2*r, 2*r);
    fill(255);
    text("Level 3", 3*xb, yb+r+20);

    fill(255);
    text("Level 4", 4*xb, yb+r+20);
    alien.desenha();

    fill(255);
    imageMode(CENTER);
    image(blackHole, 5*xb, yb, 2*r, 2*r);
    fill(255);
    text("Level 5", 5*xb, yb+r+20);
  } else if (menu.selected==Menu.BASIC) { //Menu Basic
    basic.desenha();
    l = Menu.BASIC;
  } else if (menu.selected==Menu.PLANETS) { //Menu Planets
    planets.desenha();
    l = Menu.PLANETS;
  } else if (menu.selected==Menu.SHIP) {//Menu Spaceship
    spaceship.desenha();
    l = Menu.SHIP;
  } else if (menu.selected==Menu.ALIEN) {//Menu Aliens
    aliens.desenha();
    l = Menu.ALIEN;
  } else if (menu.selected==Menu.BLACK) { //Menu Blacks
    blacks.desenha();
    l = Menu.BLACK;
  }
}

void mousePressed() {
  
  if (menu.selected == Menu.SHIP) {
    spaceship.mousePressed();
  }

  //Iniciar níveis no MENU ao pressionar o rato
  if (menu.selected == Menu.MENU) {
    if (dist(mouseX, mouseY, xb, yb)<=r) {
      menu.selected=Menu.BASIC;
      basic.startLevel();
    }  
    if (dist(mouseX, mouseY, 2*xb, yb)<=r) {
      menu.selected=Menu.PLANETS;
      planets.startLevel();
    }  
    if (dist(mouseX, mouseY, 3*xb, yb)<=r) {
      menu.selected=Menu.SHIP;
      spaceship.startLevel();
    }
    if (dist(mouseX, mouseY, 4*xb, yb)<=r) {
      menu.selected=Menu.ALIEN;
      aliens.startLevel();
    }
    if (dist(mouseX, mouseY, 5*xb, yb)<=r) {
      menu.selected=Menu.BLACK;
      blacks.startLevel();
    }
  } 

  //Iniciar os níveis no menu WON
  if (menu.selected == Menu.WON) {
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>2.55*height/5-alt/2 && mouseY<2.55*height/5+alt/2) {
      menu.selected = l+1;
      basic.startLevel();
      planets.startLevel();
      spaceship.startLevel();
      blacks.startLevel();
      aliens.startLevel();
    }
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>3.55*height/5-alt/2 && mouseY<3.55*height/5+alt/2) {
      menu.selected = Menu.MENU;
    }
  }

  //Iniciar os níveis no menu LOST
  if (menu.selected == Menu.LOST) {
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>2.55*height/5-alt/2 && mouseY<2.55*height/5+alt/2) {
      menu.selected = l;
      basic.startLevel();
      planets.startLevel();
      spaceship.startLevel();
      blacks.startLevel();
      aliens.startLevel();
    }
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>3.55*height/5-alt/2 && mouseY<3.55*height/5+alt/2) {
      menu.selected = Menu.MENU;
    }
  }

  //Regressar ao MENU ao ganhar o jogo todo
  if (menu.selected == Menu.FINAL) {
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>3.55*height/5-alt/2 && mouseY<3.55*height/5+alt/2) {
      menu.selected = Menu.MENU;
    }
  }
}