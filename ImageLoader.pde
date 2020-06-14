class ImageLoader {
  PImage img_WhitePawn;
  PImage img_WhiteQueen;
  PImage img_WhiteKing;
  PImage img_WhiteBishop;
  PImage img_WhiteKnight;
  PImage img_WhiteRook;
  PImage img_BlackPawn;
  PImage img_BlackQueen;
  PImage img_BlackKing;
  PImage img_BlackBishop;
  PImage img_BlackKnight;
  PImage img_BlackRook;

  void loadAll() {
    img_WhitePawn = loadImage("images/whitePawn.png");
    img_WhiteQueen = loadImage("images/whiteQueen.png");
    img_WhiteKing = loadImage("images/whiteKing.png");
    img_WhiteBishop = loadImage("images/whiteBishop.png");
    img_WhiteKnight = loadImage("images/whiteKnight.png");
    img_WhiteRook = loadImage("images/whiteRook.png");
    img_BlackPawn = loadImage("images/blackPawn.png");
    img_BlackQueen = loadImage("images/blackQueen.png");
    img_BlackKing = loadImage("images/blackKing.png");
    img_BlackBishop = loadImage("images/blackBishop.png");
    img_BlackKnight = loadImage("images/blackKnight.png");
    img_BlackRook = loadImage("images/blackRook.png");
  }
}
