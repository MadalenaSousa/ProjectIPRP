class Menu {
  static final int MENU = 0;
  static final int BASIC = 1;
  static final int PLANETS = 2;
  static final int BLACK = 3;
  static final int ALIEN = 4;
  static final int WON = 5;
  static final int LOST = 6;
  
  int selected;
  
  Menu(int selected) {
    this.selected = selected;
  }
}