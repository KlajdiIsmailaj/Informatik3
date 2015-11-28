#pragma once
#include "Buffer.h"
#include <thread>
//#include <mutex>
#include <condition_variable>
#include <chrono>
#include <random>
#include <ctime>

using namespace std;

extern std::mutex theMutex;

class Producer{
public:
	Producer(Buffer<int> *pbuffer)
	{
		pBuffer = pbuffer;
	}

private:
	Buffer<int> *pBuffer;

public:
	int produce();

	//void produce1(); // in case produce does not return !!

};

