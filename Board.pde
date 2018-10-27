/**
 * This is the Board class, it contains all the nodes and the players.
 */
class Board {
  /** 
   * ArrayList of Nodes inside the board. These are most of the Nodes that will exist in the gamea
   * Any move that does anything with Nodes that exist outside of the game will deal with these nodes.
   * It's actually convenient to having universal nodes rather than piece-specific nodes because these are actual locations; there should only be one
   */
  private ArrayList<Node> boardNodes; 
  private Player[] players = new Player[2];          //new array of player objects. Of course, there are only two players, and the array itself is not edited.
  
  /** Initializes every node inside the ArrayList. giving them the proper coordinates. Initializes players in the players array. */ 
  Board() {
    boardNodes = new ArrayList<Node>();
    for(int i = 0; i < 9; i++) {
      for(int j = 0; j < 10; j++) {
        boardNodes.add(new Node(i, j));
      }
    }
    players[0] = new Player(0, boardNodes);
    players[1] = new Player(1, boardNodes);
  }
  
  Player[] getPlayers() {
    return players;
  }
  ArrayList<Node> getNodes() {
    return boardNodes;
  }
  
  /** clears the background, draws the board, all the nodes (which show up in the form of the lines that come off of them), and all the pieces, and selected nodes. */
  void display() {
    fill(252, 174, 63);
    rect(50, 50, 720, 810);
    for(Node node: boardNodes)
      node.display();
    fill(0, 0, 255);
    rect(50, 410, 720, 90);
    for(Player player: players) {
      for(ChessPiece piece: player.getPieces())
        piece.display();
    }
    for(Node node: boardNodes) {
      node.displaySelected();
    }
  }
}
