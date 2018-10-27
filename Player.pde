class Player {
  private int playernum;
  private ArrayList<ChessPiece> pieces;
  
  Player(int playernum, ArrayList<Node> board) {
    this.playernum = playernum;
    pieces = new ArrayList<ChessPiece>();
    for(int i = 0; i < 5; i++)
      pieces.add(new Soldier(getNode(i*2, 6 - 3*playernum, board), playernum));
    for(int i = 0; i < 2; i++) {
      pieces.add(new Cannon(getNode(1 + 6*i, 7 - 5*playernum, board), playernum));
      pieces.add(new Horse(getNode(1 + 6*i, 9 - 9*playernum, board), playernum));
      pieces.add(new Chariot(getNode(0 + 8*i, 9 - 9*playernum, board), playernum));
      pieces.add(new Elephant(getNode(2 + 4*i, 9 - 9*playernum, board), playernum));
      pieces.add(new Advisor(getNode(3 + 2*i, 9 - 9*playernum, board), playernum));
      }
    pieces.add(new General(getNode(4, 9 - 9*playernum, board), playernum));
  }
  Node getNode(int x, int y, ArrayList<Node> nodes) {
    for(Node node: nodes) {
      if(node.getX() == x && node.getY() == y)
        return node;
    }
    return null;
  }
  ArrayList<ChessPiece> getPieces() {
    return pieces;
  }
  
  void killPiece(Node node) {
    for(int i = 0; i < pieces.size(); i++) {
      if(node.equals(pieces.get(i).getNode()))
        pieces.remove(i);
    }
  }
  void mouseClicked() {
    
  }
}
