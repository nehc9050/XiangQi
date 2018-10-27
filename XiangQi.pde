/**
 * @Author David Chen, Boston Latin School class of '18
 * AP Compsci A (Java) section 1, Dr. Nguyen
 * @Version 1.0
 * @since Last updated 5/7/2018
 * Game: Chinese Chess - no checks or checkmates implemented.
 * Notes for future improvements: 
 * implement checks & checkmates
 * implement game start/game over screen, restart button
 * import to mobile?
 * make variables such as piece size and node placements less independent (only have to change one variable to change multiple)
 * clean up the code (probably lots of inefficiencies in how everything is done
 * please enjoy!
 */ 

import java.util.*;

/** 
 * Board object ChessBoard - contains all the players and nodes (points pieces can move on) 
 */
 Board chessBoard;

/** 
 * A ChessPiece reference that holds whatever ChessPiece object is selected when in the game 
 */
ChessPiece selectedPiece;

/** 
 * Keeps track of whatever player's turn it currently is (an index in an array of 2 players)
 */
int currentPlayer;

/** 
 * The font to be displayed on the pieces.
 */
PFont sysFont; 

/**
 * creates a window of size 825, 910
 * Creates a Board object for chessBoard to reference
 * Sets the current player to the first player (index 0 in the player array)
 * Sets the font to SimSun (a Chinese font)
 * Makes the default font everything is displayed in sysFont
 */
void setup() {
  size(825, 910);
  chessBoard = new Board();
  currentPlayer = 0;
  sysFont = createFont("SimSun.ttf", 40, true);
  textFont(sysFont);
}

/**
 * draws a brown background and calls the display method of chessBoard 
 * chessBoard contains the display methods for everything else as well (nodes, pieces)
 */
void draw() {
  background(199, 97, 0);
  chessBoard.display();
}

/**
 * Selects a piece if it is clicked
 * Else everything is deselected
 * If a void node is clicked while a piece is selected, the piece will move to that node
 * If a piece of the opposite side is in that node, kill it
 */
void mouseClicked() {
  boolean pieceSelected = false;
  for(ChessPiece piece : chessBoard.getPlayers()[currentPlayer].getPieces()) {
    if (abs(mouseX - piece.getX()) < 35 && abs(mouseY - piece.getY()) < 35) {
      selectedPiece = piece;
      piece.makeMoves(chessBoard.getNodes(), currentPlayer);
      piece.checkMoves(chessBoard.getPlayers()[currentPlayer].getPieces(), chessBoard.getPlayers()[-currentPlayer + 1].getPieces());
      pieceSelected = true;
    } else {
        piece.deselect();
    }
  }
  if(selectedPiece != null) {
    selectedPiece.select();
    for(Node move: selectedPiece.getMoves()) {
      float diffx = (float)(mouseX - (move.getX()*90 + 50));
      float diffy = (float)(mouseY - (move.getY()*90 + 50));
      if (sqrt(diffx*diffx + diffy*diffy) < 20) {
        ArrayList<ChessPiece> otherSide = chessBoard.getPlayers()[-currentPlayer + 1].getPieces();
        for(int i = otherSide.size() - 1; i >= 0; i--) {
          if(otherSide.get(i).getNode() == move) {
            selectedPiece.kill(chessBoard.getPlayers()[-currentPlayer + 1].getPieces(), move);
            otherSide.remove(i);
            System.out.println("killed!");
          }
        }
        selectedPiece.move(move);
        System.out.println("moved");
        selectedPiece = null;
        currentPlayer = -currentPlayer + 1;
      }
    }
  }
  if (!pieceSelected) selectedPiece = null;
}
