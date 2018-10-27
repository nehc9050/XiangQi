class Soldier extends ChessPiece {
  boolean riverCrossed;
  Soldier(Node node, int side) {
    super(node, side);
    if(side == 0)
      changeText("兵");
    else
      changeText("卒");
    riverCrossed = false;
  }

  void makeMoves(ArrayList<Node> nodes, int playernum) {
    ArrayList<Node> moves = new ArrayList<Node>();
    for(Node node: nodes) {
      if(node.getX() == getNode().getX() && node.getY() == getNode().getY() + playernum*2 - 1 && node.isLegalNode()) 
        moves.add(node);
      if(riverCrossed) {
        if(abs(node.getX() - getNode().getX()) == 1 && node.getY() == getNode().getY())
          moves.add(node);
      }
    }
    setMoves(moves);
  }
  void checkMoves(ArrayList<ChessPiece> pieces) {
    super.checkMoves(pieces);
  }
  void checkMoves(ArrayList<ChessPiece> ownPieces, ArrayList<ChessPiece> otherPieces) {
    checkMoves(ownPieces);
  }
  
  void move(Node node){
    super.move(node);
    if(getSide() == 0 && node.getY() <= 4)
      riverCrossed = true;
    if(getSide() == 1 && node.getY() >= 5)
      riverCrossed = true;
  }
  
  void display() {
    super.display();
  }
}
