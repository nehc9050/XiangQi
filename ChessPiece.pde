abstract class ChessPiece {
  private Node occupiedNode;
  private int side;
  private boolean selected;
  private int x;
  private int y;
  private ArrayList<Node> possibleMoves;
  private String displayText;
  
  ChessPiece(Node node, int side) {
    occupiedNode = node;  
    this.side = side;
    x = occupiedNode.getX()*90 + 50;
    y = occupiedNode.getY()*90 + 50;
    selected = false;
    possibleMoves = new ArrayList<Node>();
    displayText = "兵";
  }
  String getName() {
    return "";
  }
  boolean isSelected() {
    return selected;  
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getNodeX() {
    return occupiedNode.getX();
  }
  int getNodeY() {
    return occupiedNode.getY();
  }
  Node getNode() {
    return occupiedNode;
  }
  ArrayList<Node> getMoves() {
    return possibleMoves;
  }
  int getSide() {
    return side;
  }
  
  void changeText(String str) {
    displayText = str;
  }
  void move(Node node){
    occupiedNode = node;
    x = occupiedNode.getX()*90 + 50;
    y = occupiedNode.getY()*90 + 50;
    deselect();
  }
  void select() {
    for(Node move: possibleMoves)
      move.select();
    selected = true;
  }
  void deselect() {
    for(Node move: possibleMoves) {
      move.deselect();
    }
    selected = false;
  }
  void setMoves(ArrayList<Node> possibleMoves) {
    this.possibleMoves = possibleMoves;
  }
  void makeMoves(ArrayList<Node> nodes, int playernum) {};
  void clearMoves() {
    possibleMoves = new ArrayList<Node>();
  }
  void checkMoves(ArrayList<ChessPiece> pieces) {
    if(pieces.get(0).getSide() == getSide()) {
      for(int i = getMoves().size() - 1; i >= 0; i--) {
        if(getMoves().get(i).isOccupied(pieces)) {
          getMoves().remove(i);
        }
      }
    }
  }
  void checkMoves(ArrayList<ChessPiece> ownPieces, ArrayList<ChessPiece> otherPieces) {
    checkMoves(ownPieces);
    checkMoves(otherPieces);
  }
  
  void kill(ArrayList<ChessPiece> pieces, Node node) {
  }
  
  void display() {
    fill(247, 230, 192);
    if(sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y)) < 35 || selected) {
      ellipse(x, y, 80, 80);
      if(side == 0)
        stroke(255, 0, 0);
      ellipse(x, y, 70, 70);
      stroke(0);
    }
    else {
      ellipse(x, y, 70, 70);
      if(side == 0)
        stroke(255, 0, 0);
      ellipse(x, y, 60, 60);
      stroke(0);
    }
    if(side == 0)
      fill(255, 0, 0);
    else
      fill(0, 0, 0);
    text(displayText, x - 19, y + 13);
  }
}
