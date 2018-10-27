class Elephant extends ChessPiece {
  Elephant(Node node, int side) {
    super(node, side);
    if(side == 0)
      changeText("相");
    else
      changeText("象");
  }
  
  void makeMoves(ArrayList<Node> nodes, int playernum) {
    ArrayList<Node> moves = new ArrayList<Node>();
    for(Node node: nodes) {
      if(abs(node.getX() - getNode().getX()) == 2 && abs(node.getY() - getNode().getY()) == 2)
        moves.add(node);
    }
    setMoves(moves);
  }
  //for any piece in its way, if it's one unit in both the x and y direction away, remove from getMoves the node 2 in the same direction.
  void checkMoves(ArrayList<ChessPiece> pieces) {
    super.checkMoves(pieces);
    for(int i = getMoves().size() - 1; i >= 0; i--) {
      if(getSide() == 0) {
        if(getMoves().get(i).getY() < 5) 
          getMoves().remove(i);
      } else {
        if(getMoves().get(i).getY() > 4)
          getMoves().remove(i);
      }
    }
    
    for(int i = pieces.size() - 1; i >= 0; i--) {
      int diffX = getNode().getX() - pieces.get(i).getNodeX();
      int diffY = getNode().getY() - pieces.get(i).getNodeY();
      if(abs(diffX) == 1 && abs(diffY) == 1) {
        for(int j = getMoves().size() - 1; j >= 0; j--) {
          if(getMoves().get(j).getX() == getNode().getX() - 2*(diffX) && getMoves().get(j).getY() == getNode().getY() - 2*(diffY))
            getMoves().remove(j);
        }
      }
    }
  }
  
  void display() {
    super.display();
  }
}
