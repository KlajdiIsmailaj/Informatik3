#pragma once
#include "Buffer.h"
#include <thread>
#include <mutex>
#include<condition_variable>
#include <chrono>
using namespace std;

class Consumer{

private:
	Buffer <int> buffer;

private:
	void consume(int element);

};

