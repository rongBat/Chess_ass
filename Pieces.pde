// handy integer position storage  //<>//
class Square {
  int X, Y;
  Square(int x, int y) {
    X = x;
    Y = y;
  }
}

// abstract class for generic piece properties/methods
class Piece {
  String Type;
  String Colour;
  Square Position;



  Piece(String type, Square position, String colour) { 
    Type=type;
    Position=position;
    Colour=colour.toLowerCase();
  }

  int x() {
    return Position.X;
  }
  int y() {
    return Position.Y;
  }

  PImage getImage() {
    println("getImage()");
    return null;
  }
  //abstract boolean isValidMove(Square target, Square clickedSquare);
  boolean isvalidMove(Square target, Square selected) {
    println("Whoops, this isValidMove shouldn't run");
    return true;
  }
}



//classes for each piece
class Bishop extends Piece {

  Bishop(int x, int y, String colour) {
    super("Bishop", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour.equals("black") == true) {
      return images.img_BlackBishop;
    } else { 
      return images.img_WhiteBishop;
    }
  }


  boolean isvalidMove(Square target, Square selected) {

    println("isValidMove() "+Type);
    int x_diff = abs(target.X-selected.X);
    int y_diff = abs(target.Y-selected.Y);
    return x_diff==y_diff;
  }
}


class King extends Piece {

  King(int x, int y, String colour) {
    super("King", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour.equals("black") == true) {
      return images.img_BlackKing;
    } else { 
      return images.img_WhiteKing;
    }
  }

  boolean isvalidMove(Square target, Square selected) {
    println("isValidMove() "+Type);
    int x_diff = abs(target.X-selected.X);
    int y_diff = abs(target.Y-selected.Y);
    if (x_diff < 2 && y_diff < 2) {
      return true;
    } else { 
      return false;
    }
  }
}

class Queen extends Piece {

  Queen(int x, int y, String colour) {
    super("Queen", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour.equals("black") == true) {
      return images.img_BlackQueen;
    } else { 
      return images.img_WhiteQueen;
    }
  } 

  boolean isvalidMove(Square target, Square selected) {
    int x_diff = abs(target.X-selected.X);
    int y_diff = abs(target.Y-selected.Y);
    if (x_diff == y_diff || target.Y==selected.Y || target.X==selected.X) {
      return true;
    } else { 
      return false;
    }
  }
}


class Pawn extends Piece {

  Pawn(int x, int y, String colour) {

    super("Pawn", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour.equals("black") == true) {
      return images.img_BlackPawn;
    } else { 
      return images.img_WhitePawn;
    }
  }

  boolean isvalidMove(Square target, Square selected) {
    int x_diff = (selected.X-target.X);
    int y_diff = (selected.Y-target.Y);
    //println(y_diff + "," + x_diff);
    if (this.Colour.equals("black") == true) {
      //home row can move two spaces
      if (selected.Y==1 && y_diff==-2 && x_diff == 0) return true;
      if (y_diff==-1 && x_diff == 0) return true;
    } else {
      //home row can move two spaces
      if (selected.Y == 6 && y_diff == 2  && x_diff == 0) return true;
      if (y_diff == 1 && x_diff == 0) return true;
    }
    return false;
  }
}



class Rook extends Piece {

  Rook(int x, int y, String colour) {
    super("Rook", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour.equals("black") == true) {
      return images.img_BlackRook;
    } else { 
      return images.img_WhiteRook;
    }
  }

  boolean isvalidMove(Square target, Square selected) {
    if (target.X==selected.X || target.Y==selected.Y) {
      return true;
    } else {
      return false;
    }
  }
}


class Knight extends Piece {
  Knight(int x, int y, String colour) {
    super("Knight", new Square(x, y), colour);
  }

  PImage getImage() {
    if (this.Colour.equals("black") == true) {
      return images.img_BlackKnight;
    } else { 
      return images.img_WhiteKnight;
    }
  }

  boolean isvalidMove(Square target, Square selected) {
    int x_diff = abs(target.X-selected.X);
    int y_diff = abs(target.Y-selected.Y);
    if (x_diff==1 && y_diff==2 || x_diff==2 && y_diff ==1) {
      return true;
    } else { 
      return false;
    }
  }
}
