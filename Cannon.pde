class Cannon extends ChessPiece {
  Cannon(Node node, int side) {
    super(node, side);
    if(side == 0)
      changeText("炮");
    else
      changeText("砲");
  }
  boolean jumpable() {
    return false;
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
  
  void checkMoves(ArrayList<ChessPiece> ownPieces, ArrayList<ChessPiece> otherPieces) {
    ArrayList<Node> occupied = new ArrayList<Node>();
    for(Node node: getMoves()) {
      if(node.isOccupied(ownPieces) || node.isOccupied(otherPieces))
        occupied.add(node);
    }
    
    for(int index = occupied.size() - 1; index >= 0; index--) {
      int diffX = getNode().getX() - occupied.get(index).getX();
      int diffY = getNode().getY() - occupied.get(index).getY();
      for(int i = getMoves().size() - 1; i >= 0; i--) {
        if(diffX != 0 && (getNode().getX() - getMoves().get(i).getX())/diffX >= 1) {
          getMoves().remove(i);
        }
        if(diffY != 0 && (getNode().getY() - getMoves().get(i).getY())/diffY >= 1) {
          getMoves().remove(i);
        }
      }
    }
    
    //index 0 = right, 1 = left, 2 = up, 3 = down. Each of these booleans represents the node on the very edge
    //of the cannon's moveset in that direction. If the node is occupied, then the cannon can move in that direction.
    Boolean[] canMove = new Boolean[] {false, false, false, false};

    Node rightNode = new Node(10, getNodeY());
    Node leftNode = new Node(0, getNodeY());
    Node upNode = new Node(getNodeX(), 0);
    Node downNode = new Node(getNodeX(), 10);
    
    for(Node node: occupied) {
      if(node.getY() == getNodeY()) {
        if(node.getX() < rightNode.getX() && node.getX() > getNodeX()) {
          rightNode = node;
          canMove[0] = true;
        }
        if(node.getX() > leftNode.getX() && node.getX() < getNodeX()) {
          leftNode = node;
          canMove[1] = true;
        }
      }
      if(node.getX() == getNodeX()) {
        if(node.getY() > upNode.getY() && node.getY() < getNodeY()) {
          upNode = node;
          canMove[2] = true;
        }
        if(node.getY() < downNode.getY() && node.getY() > getNodeY()) {
          downNode = node;
          canMove[3] = true;
        }
      }
    }
    
    System.out.println(rightNode.getX() + " " + rightNode.getY());
    System.out.println(leftNode.getX() + " " + leftNode.getY());
    System.out.println(upNode.getX() + " " + upNode.getY());
    System.out.println(downNode.getX() + " " + downNode.getY());
    
    Node[] killable = new Node[4];
    for(Node node: occupied) {
      int x = node.getX();
      int y = node.getY();
      if(y == rightNode.getY()) {
        if(canMove[0]) {
          if(x > rightNode.getX() && (killable[0] == null || x < killable[0].getX()))
            killable[0] = node;
        }
        if(canMove[1]) {
          if(x < leftNode.getX() && (killable[1] == null || x > killable[1].getX()))
            killable[1] = node;
        }
      }
      if(x == upNode.getX()) {
        if(canMove[2]) {
          if(y < upNode.getY() && (killable[2] == null || y > killable[2].getY()))
            killable[2] = node;
        }
        if(canMove[3]) {
          if(y > downNode.getY() && (killable[3] == null || y > killable[3].getY()))
            killable[3] = node;
        }
      }
    }
    
    for(Node node: killable) {
      if(node != null && !node.isOccupied(ownPieces)) 
        getMoves().add(node);
    }
  }
  
  void display() {
    super.display();
  }
}
  
//enum Direction {
//  UP(0, 1),
//  DOWN(0, -1),
//  LEFT(-1, 0),
//  RIGHT(1, 0);
  
//  Direction(int dX, int dY) {
//  }
//}
