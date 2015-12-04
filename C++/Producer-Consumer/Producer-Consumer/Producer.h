#pragma once
// header class for producer
#include "Buffer.h"
#include <thread> 
#include <condition_variable>
#include <chrono>
#include <random>
#include <ctime>
//required declarations
using namespace std;

extern std::mutex theMutex;

class Producer{
	// constructor of the producer class
	// here we parse the buffer by reference
public:
	Producer(Buffer<int> *pbuffer)
	{
		pBuffer = pbuffer;
	}

// function and buffer variable declaration	
public:
	int produce();
	

	Buffer<int> *pBuffer;
	
	

};

