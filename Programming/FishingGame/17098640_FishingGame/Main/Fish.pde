class Fish
{
  int sizeX, sizeY;
  int x;
  int y;
  int speed;

  PImage anim01, anim02;

  //Frame Counter
  int count = 1;
  int counter =  1;

  Fish(int x, int y, int sizeX, int sizeY, int LEVEL)
  {

    this.x = x;
    this.y = y;

    this.sizeX = sizeX;
    this.sizeY = sizeY;

    anim01 = loadImage("fish.png");
    anim01.resize(sizeX, sizeY);

    anim02 = loadImage("fish.png");
    anim02.resize(sizeX - 10, sizeY - 10);

    switch(LEVEL) {
    case 1: 
      speed = 3;
      break;
    case 2: 
      speed = 5;
      break;
    case 3: 
      speed = 7;
    }
  }

  void drawFish()
  {
    if (count < 30)
      image(anim01, x, y);
    else
      image(anim02, x, y);

    if (count == 60 || count == 0)
      counter = - counter;

    count = count + counter;
  }

  void movement()
  {    
    x = x + speed;

    if (x >= width - sizeX || x <= 0)
    { 
      y = y - sizeY; 
      speed = -speed;
    }
  }

  void update()
  {
    drawFish();
    movement();
  }

  boolean isCaught(Hook hook, boolean cast) //FISH & HOOK COLLISION
  {
    if ( x >= hook.x && x <= hook.x + sizeX && y >= hook.y && y <= hook.y + sizeY && cast == true)
    {
      println("Hook Caught Fish ");
      return true;
    } else
      return false;
  }

  void fireBubble(int LEVEL)
  {
    float bubbleCounter = 0;

    bubbleCounter = random(100);

    if (bubbleCounter >= 99.9)
    {
      println("Bubble Created");
      bubble.add(new Bubble(x, y, LEVEL));
    }
  }
}