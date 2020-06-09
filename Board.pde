class Board {
  Piece[][] Pieces;


  //board constructor
  Board() {
    Pieces = new Piece[8][8];
  }
  void addPiece(Piece piece) {
    println(piece);
    Pieces[piece.x()][piece.y()] = piece;
  }
  void addPiece(String type,int x, int y, String colour){
    if(type=="Bishop") addPiece(type,x,y,colour);
    
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
