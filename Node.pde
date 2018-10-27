class Node {
  private int x, y;
  boolean selected;
  
  Node(int x, int y) {
    this.x = x;
    this.y = y;
    selected = false;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  boolean isCastle(int player) {
    if(x < 3 || x > 5)
      return false;
    if(player == 0) {
      if(y < 7)
        return false;
    }
    if(player == 1) {
      if(y > 2)
        return false;
    }
    return true;
  }
  boolean isSelected() {
    return selected;
  }
  boolean isOccupied(ArrayList<ChessPiece> pieces) {
    for(ChessPiece piece: pieces) {
      if(piece.getNode().getX() == x && piece.getNode().getY() == y)
        return true;
    }
    return false;
  }
  boolean isLegalNode() {
    return !(x < 0 || x > 8 || y < 0 || y > 9);
  }
  
  void select() { 
    selected = true;
  }
  void deselect() { 
    selected = false;
  }
  
  void display() {
    if(x < 8)
      line(x*90 + 50, y*90 + 50, x*90 + 140, y*90 + 50);
    if(y < 9)
      line(x*90 + 50, y*90 + 50, x*90 + 50, y*90 + 140);
    if(x > 1)
      line(x*90 + 50, y*90 + 50, x*90 - 130, y*90 + 50);
    if(y > 1)
      line(x*90 + 50, y*90 + 50, x*90 + 50, y*90 - 130);
    if(x == 3) {
      if(y == 0)
        line(x*90 + 50, y*90 + 50, (x + 2)*90 + 50, (y + 2)*90 + 50);
      if(y == 2)
        line(x*90 + 50, y*90 + 50, (x + 2)*90 + 50, (y - 2)*90 + 50);
    }
    if(x == 5) {
      if(y == 7)
        line(x*90 + 50, y*90 + 50, (x - 2)*90 + 50, (y + 2)*90 + 50);
      if(y == 9)
        line(x*90 + 50, y*90 + 50, (x - 2)*90 + 50, (y - 2)*90 + 50);
    }
  }
  
  void displaySelected() {
    if(selected) {
      fill(0, 230, 0);
      ellipse(x*90 + 50, y*90 + 50, 25, 25);
    }
  }
}
