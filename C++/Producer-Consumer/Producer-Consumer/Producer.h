#pragma once
#include "Buffer.h"
#include <thread>
#include <mutex>
#include<condition_variable>
#include <chrono>
#include <random>
#include <ctime>

using namespace std;

class Producer{

private:
	Buffer <int> buffer;

private:
	int produce();

	//void produce1(); // in case produce does not return !!

};

