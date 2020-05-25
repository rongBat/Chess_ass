class Board {
  Piece[][] Pieces;

  //board constructor
  Board() {
    Pieces = new Piece[8][8];
  }
  void addPiece(Piece piece) {
    Pieces[piece.x()][piece.y()] = piece;
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
