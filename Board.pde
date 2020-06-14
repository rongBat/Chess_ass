class Board {
  Piece[][] Pieces;
  int size;


  //board constructor
  Board(int boardSize) {
    this.size = boardSize;
    this.clearBoard();
  }
  void clearBoard() {
    // -1 because array index from 0
    Pieces = new Piece[this.size][this.size];
  }
  void addPiece(Piece piece) {
    Pieces[piece.x()][piece.y()] = piece;
  }

  void removePiece(Square target) {
    Pieces[target.X][target.Y] = null;
  }

  void resetBoard() { // setup default chess board
    this.clearBoard();

    // black side
    this.addPiece(new Rook(0, 0, "black"));
    this.addPiece(new Knight(1, 0, "black"));
    this.addPiece(new Bishop(2, 0, "black"));
    this.addPiece(new King(3, 0, "black"));
    this.addPiece(new Queen(4, 0, "black"));
    this.addPiece(new Bishop(5, 0, "black"));
    this.addPiece(new Knight(6, 0, "black"));
    this.addPiece(new Rook(7, 0, "black"));
    for (int i=0; i<8; i++) this.addPiece(new Pawn(i, 1, "black")) ;

    // white side
    this.addPiece(new Rook(0, 7, "white"));
    this.addPiece(new Knight(1, 7, "white"));
    this.addPiece(new Bishop(2, 7, "white"));
    this.addPiece(new Queen(3, 7, "white"));
    this.addPiece(new King(4, 7, "white"));
    this.addPiece(new Bishop(5, 7, "white"));
    this.addPiece(new Knight(6, 7, "white"));
    this.addPiece(new Rook(7, 7, "white"));
    for (int i=0; i<8; i++) this.addPiece(new Pawn(i, 6, "white"));
  }


  Piece getPiece(Square target) {
    return Pieces[target.X][target.Y];
  }

  void movePiece(Square from, Square to) {

    Piece temp = Pieces[from.X][from.Y]; // store piece temporarily
    temp.Position = to; // update piece's internal position

    Pieces[from.X][from.Y] = null; // clear from square
    Pieces[to.X][to.Y] = temp; // set target square to temp piece
  }
}
