class Chariot extends ChessPiece {
  Chariot(Node node, int side) {
    super(node, side);
    if(side == 0)
      changeText("俥");
    else
      changeText("車");
  }
  
  void makeMoves(ArrayList<Node> nodes, int playernum) {
    ArrayList<Node> moves = new ArrayList<Node>();
    for(Node node: nodes) {
      float x = abs((float)(node.getX() - getNode().getX()));
      float y = abs((float)(node.getY() - getNode().getY()));
      if((x == 0 || y == 0) && node.isLegalNode() && !(x == 0 && y == 0))
        moves.add(node);
      }
    setMoves(moves);
  }
  
  //checkMoves for the chariot works by making an arraylist of occupied nodes in getMoves().
  //then, for every node in that arraylist of occupied nodes, it removes from getMoves() any move beyond/including that node.
  //this is done using distance - if the distance is larger or equal to the distance of the node from the piece, remove it.
  //for the player of the opposite side, it sets it to only if the distance is larger; that way the closest node is left intact for killing.
  void checkMoves(ArrayList<ChessPiece> ownPieces, ArrayList<ChessPiece> otherPieces) {
    ArrayList<Node> ownOccupied = new ArrayList<Node>();
    ArrayList<Node> otherOccupied = new ArrayList<Node>();
    for(Node node: getMoves()) {
      if(node.isOccupied(ownPieces))
        ownOccupied.add(node);
      if(node.isOccupied(otherPieces))
        otherOccupied.add(node);
    }
    
    for(int index = ownOccupied.size() - 1; index >= 0; index--) {
      int diffX = getNode().getX() - ownOccupied.get(index).getX();
      int diffY = getNode().getY() - ownOccupied.get(index).getY();
      for(int i = getMoves().size() - 1; i >= 0; i--) {
        if(diffX != 0 && (getNode().getX() - getMoves().get(i).getX())/diffX >= 1) {
          getMoves().remove(i);
        }
        if(diffY != 0 && (getNode().getY() - getMoves().get(i).getY())/diffY >= 1) {
          getMoves().remove(i);
        }
      }
    }
    
    for(int index = otherOccupied.size() - 1; index >= 0; index--) {
      int diffX = getNode().getX() - otherOccupied.get(index).getX();
      int diffY = getNode().getY() - otherOccupied.get(index).getY();
      for(int i = getMoves().size() - 1; i >= 0; i--) {
        if(diffX != 0 && (double)(getNode().getX() - getMoves().get(i).getX())/diffX > 1) {
          getMoves().remove(i);
        }
        if(diffY != 0 && (double)(getNode().getY() - getMoves().get(i).getY())/diffY > 1) {
          getMoves().remove(i);
        }
      }
    }
  }

  void display() {
    super.display();
  }
}
