//#include "olcPixelGameEngine.h"
#include "pixels.h"

Pixels::Pixels()
{
	sAppName = "Pixels";
}

void 
Pixels::SetUpdate(int(*func)(Pixels&))
{
  update = func;
}

bool Pixels::OnUserCreate()
{
  // Called once at the start, so create things here
  return true;
}

bool Pixels::OnUserUpdate(float fElapsedTime)
{
  // called once per frame
  for (int x = 0; x < ScreenWidth(); x++)
    for (int y = 0; y < ScreenHeight(); y++)
      Draw(x, y, olc::Pixel(rand() % 255, rand() % 255, rand() % 255));
 
  // Call whatever update function is currently drawing the screen 
  // (say menu.update or snakeGame.update) and give it the pixels object.
  (*update)(*this);
 
  return true;
}
