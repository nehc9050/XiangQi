class General extends ChessPiece {
  General(Node node, int side) {
    super(node, side);
    if(side == 0)
      changeText("將");
    else
      changeText("帥");
  }

  void makeMoves(ArrayList<Node> nodes, int playernum) {
    ArrayList<Node> moves = new ArrayList<Node>();
    for(Node node: nodes) {
      float x = abs((float)(node.getX() - getNode().getX()));
      float y = abs((float)(node.getY() - getNode().getY()));
      if(x == 1 && y == 0 || x == 1 && y == 1 || x == 0 && y == 1)
        moves.add(node);
      }
    setMoves(moves);
  }
  void checkMoves(ArrayList<ChessPiece> pieces) {
    super.checkMoves(pieces);
    for(int i = getMoves().size() - 1; i >= 0; i--) {
      if(!getMoves().get(i).isCastle(getSide()))
        getMoves().remove(i);
    }
  }
  void checkMoves(ArrayList<ChessPiece> ownPieces, ArrayList<ChessPiece> otherPieces) {
    checkMoves(ownPieces);
  }
  
  void display() {
    super.display();
  }
}
