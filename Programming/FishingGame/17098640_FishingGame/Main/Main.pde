//IRFAN HANAFI 17098640
//FISHING GAME COURSEWORK
enum GameState {
  GAMEOVER, PLAY, PAUSE, WIN, SPLASH
}

GameState game = GameState.SPLASH;

int LEVEL = 1;

int score = 0;
int lives = 3;

//Object & Array Initliazation
Player p1;
Hook hook;
Fish [][] school;
boolean [][] hookedFish;
ArrayList<Bubble> bubble;
Bubble bubbleShot;
boolean isCast = false;

//PlayerSpeed
public int pSpeed = 20;

//Fish School Size
int sizeX = 3;
int sizeY = 3;

int fishSize = 50;

//Original Position for Player
public float oriX;
public float oriY;

int fishCounter = 0;

void setup()
{
  size(500, 800);

  oriX = width/2;
  oriY = height/6;

  school = new Fish[sizeY][sizeX];
  hookedFish = new boolean[sizeY][sizeX];

  bubble = new ArrayList<Bubble>();

  //Fish Array Initialization
  int fishY = height;
  for ( int j = 0; j < sizeY; j++)
  {
    int fishX = 0;

    for ( int i = 0; i < sizeX; i++)
    {
      school[j][i] = new Fish(fishX, fishY, fishSize, fishSize, LEVEL);
      hookedFish[j][i] = false;
      fishX = fishX + fishSize + 5;
    }
    fishY = fishY - fishSize - 5;
  }

  p1 = new Player(oriX, oriY);
  hook = new Hook();
}

void draw()
{
  switch(game) {

  case PLAY:
    {
      if (lives == 0)
      {
        game = GameState.GAMEOVER;
      }

      background(200, 200, 255);

      p1.drawBoat();

      noStroke();
      fill(150, 150, 255);
      rect( 0, oriY + p1.boatHeight - 5, width, height);

      isCast = hook.update(p1, isCast);

      //School of Fish Movement
      for (int j= 0; j < sizeY; j++)
      {
        for (int i = 0; i < sizeX; i++)
        {
          if (hookedFish[j][i] == false) //FISH & HOOK COLLISION
          {
            hookedFish[j][i] = school[j][i].isCaught(hook, isCast);
            if (hookedFish[j][i])
            {
              fishCounter++;
              println(fishCounter);
              score = score + 100;
            }
          }

          if (school[j][i].y <= oriY + p1.boatHeight)
            game = GameState.GAMEOVER;

          if (hookedFish[j][i] == false)
          {
            school[j][i].update();
            school[j][i].fireBubble(LEVEL);
          }
          
          if (fishCounter >= sizeX * sizeY)
            game = GameState.WIN;

          for (int k = 0; k < bubble.size(); k++)
          {

            bubbleShot = bubble.get(k);
            bubbleShot.update();

            if (bubbleShot.x <= p1.x + p1.boatWidth &&  bubbleShot.x >= p1.x && bubbleShot.y == oriY + p1.boatHeight)
            {
              lives = lives - 1;

              if (lives > 0)
                game = GameState.PAUSE;
              else
                game = GameState.GAMEOVER;
            }

            if (bubbleShot.y < oriY + p1.boatHeight)
              bubble.remove(0);
          }
        }
      }

      fill(0);
      textSize(18);
      text("Score : " + score, 300, 30);

      fill(0);
      textSize(18);
      text("Lives: " + lives, 100, 30);
    }
    break;

  case PAUSE:
    {
      textSize(24);
      text("PAUSED", width/2 - 50, height/2);
      text("Press SPACE to Continue", width/2 - 150, height/2 + 50);
    }
    break;

  case WIN:
    {
      background(0);
      
      textSize(24);
      text("YOU WON LEVEL " + LEVEL, width/2 - 100, height/2);
      text("Press S to Continue", width/2- 100, height/2 + 100);
      fill(255);
    } 
    break;

  case GAMEOVER:
    {
      background(0);
      textSize(24);
      text("GAME OVER", width/2 - 50, height/2 - 100);
      text("Press S to Continue", width/2- 100, height/2 + 50);
      fill(255);
    }
    break; 
  case SPLASH:
    {
      background(0);
      textSize(24);
      text("FISHING GAME ", width/2 - 100, 20);
      fill(255);

      textSize(12);
      text("By Irfan Hanafi, 17098640 ", width/2 - 100, 50);
      fill(255);

      textSize(12);
      text("How to Play", width/2 - 100, 80);
      fill(255);

      textSize(12);
      text("Left and Right Arrow Keys are your movement", width/2 - 100, 90);
      fill(255);

      textSize(12);
      text("Hold Down Arrow Key to release a hook", width/2 - 100, 100);
      fill(255);

      textSize(24);
      text("Press S to Play!", width/2 - 100, 150);
      fill(255);
    }
    break;
  }
}
void keyPressed()
{
  if ( key == CODED)
  {
    if (game == GameState.PLAY)
    {
      if (keyCode == LEFT && p1.x - p1.boatWidth/2 > 0 && isCast == false)
      {
        p1.x = p1.x - pSpeed;
      } else if (keyCode == RIGHT && p1.x + p1.boatWidth/2 < width && isCast == false)
      {
        p1.x = p1.x + pSpeed;
      }

      if (keyCode == DOWN)
      {
        isCast = true;
      }
    }
  }

  if (keyCode == ' ' && game == GameState.PLAY)
  {
    game = GameState.PAUSE;
  }
  else if ( keyCode == ' ' && game == GameState.PAUSE)
  {
    game = GameState.PLAY;
  }

  if ( key == 's' && game == GameState.GAMEOVER)
  {
    game = GameState.PLAY;
    LEVEL = 1;

    lives = 3;
    score = 0;

    school = null;

    school = new Fish[sizeY][sizeX];

    int fishY = height;
    for (int j = 0; j < sizeY; j++)
    {
      int fishX = 0;
      for (int i = 0; i < sizeX; i++)
      {
        school[j][i] = new Fish(fishX, fishY, fishSize, fishSize, LEVEL);
        hookedFish[j][i] = false;
        fishX = fishX + fishSize + 5;
      }
      fishY = fishY - fishSize - 5;
    }
    p1 = new Player(oriX, oriY);
    hook = new Hook();
  }

  if ( key == 's' && game == GameState.WIN)
  {
    game = GameState.PLAY;

    if (LEVEL < 3)
      LEVEL++;
    else
      game = GameState.GAMEOVER;

    fishCounter = 0;

    school = null;

    school = new Fish[sizeY][sizeX];

    int fishY = height;
    for (int j = 0; j < sizeY; j++)
    {
      int fishX = 0;
      for (int i = 0; i < sizeX; i++)
      {
        school[j][i] = new Fish(fishX, fishY, fishSize, fishSize, LEVEL);
        hookedFish[j][i] = false;
        fishX = fishX + fishSize + 5;
      }
      fishY = fishY - fishSize - 5;
    }
    p1 = new Player(oriX, oriY);
    hook = new Hook();
  }

  if ( key == 's' && game == GameState.SPLASH)
  {
    game = GameState.PLAY;
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == DOWN)
    {
      isCast = false;
    }
  }
}