//#include "olcPixelGameEngine.h"
#include "pixels.h"

int displayMenu(Pixels& pixels)
{
  pixels.DrawRect(10,10,30,30);  
  return 0;
}

int main()
{
  Pixels pixels;
	if (pixels.Construct(256, 240, 4, 4))

    pixels.SetUpdate(&displayMenu);
		pixels.Start();

    pixels.SetTargetFps(50);
    //float elapsed = pixels.StartFrame();
    //pixels.EndFrame(elapsed);

    //displayMenu();

	return 0;
}
