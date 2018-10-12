class Player
{
  float x;
  float y;
  
  int boatWidth = 50;
  int boatHeight = 40;
  
  PImage boatImage;
  
  Player(float x,float y)
  {
    this.x = x;
    this.y = y;
    
    boatImage = loadImage("boat.png");
    boatImage.resize(boatWidth, boatHeight);
  }
  
  void drawBoat()
  {
    image(boatImage, x - boatWidth/2, y);
  }
}