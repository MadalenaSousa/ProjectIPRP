PImage background, star, blackHole;
PFont f;
Alien alien;
Planet planet;
BasicLevel basic;
PlanetsLevel planets;
BlacksLevel blacks;
AlienLevel aliens;
float xb, yb;
float r;
int larg, alt;
int l;

Menu menu;

void setup() {
  size(1000, 800);

  r=80;
  xb=width/5;
  yb=height/2;
  f = createFont ("Copperplate-Bold", 100, true);
  menu = new Menu(Menu.MENU);
  larg = 305;
  alt = 100;

  //Criação dos Níveis
  basic = new BasicLevel(menu);
  planets = new PlanetsLevel(menu);
  aliens = new AlienLevel(menu);
  blacks = new BlacksLevel(menu);


  //Imagens do Menu Principal
  background = loadImage("Background.png");
  star =  loadImage("StarRed.png");
  planet = new Planet(r-10, 2*xb, color(#0C4EF0),PI/2, 0, true);
  alien = new Alien(3*xb, yb, r-10);
  blackHole = loadImage("Buraco Negro.png");
}

void draw() {
  //Desenho do background
  imageMode(CORNER);
  image(background, 0, 0, width, height);

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
  } else if (menu.selected == Menu.LOST) {
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
  } else if (menu.selected == Menu.FINAL){
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
  }else if (menu.selected == Menu.MENU) {
    textAlign(CENTER, CENTER);
    fill(200, 0, 255);
    textFont(f, 100);
    text("HUNDREDS 2.0", width/2, height/5);

    fill(255);
    imageMode(CENTER);
    image(star, xb, yb, 2*r+40, 2*r+40);
    textSize(30);
    text("Level 1", xb, yb+r+20);
  
    fill(255);
    text("Level 2", 2*xb, yb+r+20);
    planet.desenha();
    
    fill(255);
    text("Level 3", 3*xb, yb+r+20);
    alien.desenha();
    
    fill(255);
    imageMode(CENTER);
    image(blackHole, 4*xb, yb, 2*r, 2*r);
    fill(255);
    text("Level 4", 4*xb, yb+r+20);
  } else if (menu.selected==Menu.BASIC) {
    basic.desenha();
    l = Menu.BASIC;
  } else if (menu.selected==Menu.PLANETS) {
    planets.desenha();
    l = Menu.PLANETS;
  } else if (menu.selected==Menu.ALIEN) {
    aliens.desenha();
    l = Menu.ALIEN;
  } else if (menu.selected==Menu.BLACK) {
    blacks.desenha();
    l = Menu.BLACK;
  }
}

void mousePressed() {
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
      menu.selected=Menu.ALIEN;
      aliens.startLevel();
    }
    if (dist(mouseX, mouseY, 4*xb, yb)<=r) {
      menu.selected=Menu.BLACK;
      blacks.startLevel();
    }
  } 
  if (menu.selected == Menu.WON) {
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>2.55*height/5-alt/2 && mouseY<2.55*height/5+alt/2) {
      menu.selected = l+1;
      basic.startLevel();
      planets.startLevel();
      blacks.startLevel();
      aliens.startLevel();
    }
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>3.55*height/5-alt/2 && mouseY<3.55*height/5+alt/2) {
      menu.selected = Menu.MENU;
    }
  } 
  if (menu.selected == Menu.LOST) {
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>2.55*height/5-alt/2 && mouseY<2.55*height/5+alt/2) {
      menu.selected = l;
      basic.startLevel();
      planets.startLevel();
      blacks.startLevel();
      aliens.startLevel();
    }
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>3.55*height/5-alt/2 && mouseY<3.55*height/5+alt/2) {
      menu.selected = Menu.MENU;
    }
  }
    if (menu.selected == Menu.FINAL) {
    if (mouseX>width/2-larg/2 && mouseX<width/2+larg/2 && mouseY>3.55*height/5-alt/2 && mouseY<3.55*height/5+alt/2) {
      menu.selected = Menu.MENU;
    }
  }
}