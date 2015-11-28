#pragma once
#include "Buffer.h"

class Consumer{

private:
	Buffer <int> buffer[5];

private:
	void consume(int element);

};

