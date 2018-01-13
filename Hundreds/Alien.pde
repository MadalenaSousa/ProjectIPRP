class Alien {
  //Atributos
  float x, y;
  float r;
  color cor;
  float velx,vely;

  //Construtor1
  Alien(float x, float y, float r) {
    this.x=x;
    this.y=y;
    this.r=r;
    cor=color(#0CEDBE);
    velx=2;
    vely=2;
  }
  
  void move(){
    y=y+vely;
    x=x+velx;}
    
    
  void parede(){
      if(x>=width-r || x<= r){
        velx=-velx;
      }
    if(y>=height-r || y<=r){
      vely=-vely;}
    }

  void desenha() {

    ellipseMode(CENTER);
    stroke(0);
    arc(x,y,r-10, r-10, PI/4, PI-PI/4);
    fill(cor);
    ellipse(x, y, 2*r, 2*r);
    fill(255);
    ellipse(x-r/2, y, r-10, r-10);
    ellipse(x+r/2, y, r-10, r-10);
    fill(0);
    ellipse(x-r/2, y, r/3, r/3);
    ellipse(x+r/2, y, r/3, r/3);
  }
}