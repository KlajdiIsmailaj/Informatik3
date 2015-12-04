// header class for consumer
#pragma once
#include "Buffer.h"
#include <thread>
#include <condition_variable>
#include <chrono>
#include <cstdlib>

//required declarations
using namespace std;

extern std::mutex theMutex;

class Consumer{
	// constructor of the consumer class
	// here we parse the buffer by reference
public:
	Consumer(Buffer<int> *pbuffer)
	{
		pBuffer = pbuffer;
	}

	// function and buffer variable declaration	
private:
	Buffer<int> *pBuffer;

public:

	void consume();

};

