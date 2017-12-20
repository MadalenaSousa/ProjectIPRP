class Star {
  
  float x,y;
  float raio;
  color cor;
  float incX;
  
  Star(){
    x=random(raio,width-raio);
    y=random(raio,height-raio);
    raio=30;
    cor=color(255);
    inc=5;
  }
  
  void desenha() {
    ellipseMode(CENTER);
    fill(cor);
    noStroke();
    ellipse(x,y,2*raio,2*raio);
  }
 
  void grow() {
    raio=raio+1;
  }
  
  void redgiant() {
    if(raio>=80){
      cor=color(255,0,0);
    }
  }
  
  void move() {
    if(x>=width-raio){ || y>=height-raio){
      inc=-inc;
    }if(x<=raio || y<=raio){
      inc=-inc;
    }
    
    x=x+inc;
    y=y+inc;
  }
  
}