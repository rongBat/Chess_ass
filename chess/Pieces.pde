// handy integer position storage //<>//
class Square {
  int X, Y;
  Square(int x, int y) {
    X = x;
    Y = y;
  }
}

// abstract class for generic piece properties/methods
abstract class Piece {
  String Type;
  String Colour;
  Square Position;



  Piece(String type, Square position, String colour) { 
    Type=type;
    Position=position;
    Colour=colour;
  }

  int x() {
    return Position.X;
  }
  int y() {
    return Position.Y;
  }

  abstract PImage getImage();
  abstract boolean isValidMove(Square target);
}




//classes for each piece
class Bishop extends Piece {

  Bishop(int x, int y, String colour) {
    super("BISHOP", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour=="black") {
      return images.img_BlackBishop;
    } else { 
      return images.img_WhiteBishop;
    }
  }


  boolean isvalidMove(Square target) {
    if (!target) {
    }
    //STUB: need to implement valid move check;
    return true;
  }
}


class King extends Piece {

  King(int x, int y, String colour) {
    super("KING", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour=="black") {
      return images.img_BlackKing;
    } else { 
      return images.img_WhiteKing;
    }
  }

  boolean isvalidMove(Square target) {
    //STUB: need to implement valid move check;
    return true;
  }
}

class Queen extends Piece {

  Queen(int x, int y, String colour) {
    super("QUEEN", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour == "black") {
      return images.img_BlackQueen;
    } else { 
      return images.img_WhiteQueen;
    }
  } 

  boolean isvalidMove(Square target) {
    //STUB: need to implement valid move check;
    return true;
  }
}

class Pawn extends Piece {

  Pawn(int x, int y, String colour) {

    super("PAWN", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour == "black") {
      return images.img_BlackPawn;
    } else { 
      return images.img_WhitePawn;
    }
  }

  boolean isvalidMove(Square target) {
    //STUB: need to implement valid move check;
    return true;
  }
}

class Rook extends Piece {

  Rook(int x, int y, String colour) {
    super("ROOK", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour=="black") {
      return images.img_BlackRook;
    } else { 
      return images.img_WhiteRook;
    }
  }

  boolean isvalidMove(Square target) {
    //STUB: need to implement valid move check;
    return true;
  }
}

class Knight extends Piece {
  Knight(int x, int y, String colour) {
    super("KNIGHT", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour=="black") {
      return images.img_BlackKnight;
    } else { 
      return images.img_WhiteKnight;
    }
  }

  boolean isvalidMove(Square target) {
    //STUB: need to implement valid move check;
    return true;
  }
}
