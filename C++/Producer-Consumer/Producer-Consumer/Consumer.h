#pragma once
#include "Buffer.h"
#include <thread>
//#include <mutex>
#include <condition_variable>
#include <chrono>
#include <cstdlib>
using namespace std;

extern std::mutex theMutex;

class Consumer{
public:
	Consumer(Buffer<int> *pbuffer)
	{
		pBuffer = pbuffer;
	}
private:
	Buffer<int> *pBuffer;

public:

	int consume();

};

