class Menu {
  static final int MENU = 0;
  static final int BASIC = 1;
  static final int PLANETS = 2;
  static final int SHIP = 3;
  static final int ALIEN = 4;
  static final int BLACK = 5;
  static final int WON = 6;
  static final int LOST = 7;
  static final int FINAL = 8;
  
  int selected;
  
  Menu(int selected) {
    this.selected = selected;
  }
}