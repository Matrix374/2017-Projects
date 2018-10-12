class Hook
{
  float x = 0;
  float y = oriY + p1.boatHeight;

  int hookSize = 25;

  PImage hookImage;

  Hook()
  {
    hookImage = loadImage("hook.png");
    hookImage.resize(hookSize, hookSize);
  }

  void render(Player p1)
  { 
    stroke(0);
    line(p1.x + hookSize/2, oriY + p1.boatHeight, x + hookSize/2, y);

    image(hookImage, x, y);
  }

  boolean update(Player p1, boolean cast)
  {
    if (cast)
    {
      x = p1.x;
      y = y + 5;

      render(p1);

      if (y > height)
      {
        cast = false;
        return false;
      }
      return true;
    } else
    {
      if (y > oriY + p1.boatHeight)
      {
        x = p1.x ;
        y = y - 10;
        render(p1);
      }

      return false;
    }
  }
}