class Bubble
{
  int x;
  float y;
  float bubbleSpeed;

  int count = 0;
  
  PImage bubbleImage;

  Bubble(int x, int y, int LEVEL)
  {
    
    bubbleImage = loadImage("bubble.png");
    bubbleImage.resize(20,20);
    
    this.x = x;
    this.y = (float)y;

    switch(LEVEL)
    {
    case 1:
      {
        bubbleSpeed = 0.25;
        break;
      }
    case 2:
      {
        bubbleSpeed = 0.5;
        break;
      }
    case 3:
      {
        bubbleSpeed = 0.75;
        break;
      }
    }
  }

  void render()
  {
    image(bubbleImage, x, y);
  }

  void movement()
  {
    y = y - bubbleSpeed;
  }

  void update()
  {
    movement();
    render();
  }
}