class Horse extends ChessPiece {
  Horse(Node node, int side) {
    super(node, side);
    if(side == 0)
      changeText("傌");
    else
      changeText("馬");
  }
  boolean isBlocked() {
    return true;
  }
  
  void makeMoves(ArrayList<Node> nodes, int playernum) {
    ArrayList<Node> moves = new ArrayList<Node>();
    for(Node node: nodes) {
      float x = abs((float)(node.getX() - getNode().getX()));
      float y = abs((float)(node.getY() - getNode().getY()));
      if(x == 1 && y == 2 || x == 2 && y == 1)
        moves.add(node);
      }
    setMoves(moves);
  }
  void checkMoves(ArrayList<ChessPiece> pieces) {
    super.checkMoves(pieces);
    for(ChessPiece piece: pieces) {
      int diffX = piece.getNode().getX() - getNode().getX();
      int diffY = piece.getNode().getY() - getNode().getY();
      for(int i = getMoves().size() - 1; i >= 0; i--) {
        if(diffX == 1 && diffY == 0) {
          if(abs(getMoves().get(i).getY() - getNode().getY()) == 1 && getMoves().get(i).getX() > getNode().getX())
            getMoves().remove(i);
        }
        if(diffX == 0 && diffY == 1) {
          if(getMoves().get(i).getY() > getNode().getY() && abs(getMoves().get(i).getX() - getNode().getX()) == 1)
            getMoves().remove(i);
        }
        if(diffX == -1 && diffY == 0) {
          if(abs(getMoves().get(i).getY() - getNode().getY()) == 1 && getMoves().get(i).getX() < getNode().getX())
            getMoves().remove(i);
        }
        if(diffX == 0 && diffY == -1) {
          if(getMoves().get(i).getY() < getNode().getY() && abs(getMoves().get(i).getX() - getNode().getX()) == 1)
            getMoves().remove(i);
        }
      }
    }
  }
  
  void display() {
    super.display();
  }
}
