#include "olcPgeManualLoop.h"
#include <algorithm>

class Pixels : public olc::PixelGameEngine
{
public:
	Pixels();
  void SetUpdate(int(*func)(Pixels&));

	bool OnUserCreate() override;

	bool OnUserUpdate(float fElapsedTime) override;

private:
  int (*update)(Pixels&);

};