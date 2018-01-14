class Menu {
  
  //Atributos
  static final int MENU = 0; //variáveis cujo valor é estático, é sempre o mesmo onde quer que a chame, o valor do atributo estático é sempre o mesmo de objeto para objeto
  static final int BASIC = 1;
  static final int PLANETS = 2;
  static final int SHIP = 3;
  static final int ALIEN = 4;
  static final int BLACK = 5;
  static final int WON = 6;
  static final int LOST = 7;
  static final int FINAL = 8; 
  int selected; //variável que guarda os valores correspondentes aos níveis e menus
  
  //Construtor
  Menu(int selected) {
    this.selected = selected;
  }
}