/**
 * Advisor class, moves like the king (one in any direction) and has same limitations.
 */

class Advisor extends ChessPiece {
  Advisor(Node node, int side) {
    super(node, side);
    if(side == 0)
      changeText("仕");
    else
      changeText("士");
  }
  
  /** constructs an arraylist of nodes that references every node within 1 of the piece node */
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
  
  /** removes moves from the possible moves arraylist any node occupied by the same side and any nodes outside the "castle" (actually called a palace, but whatever */ 
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
}
