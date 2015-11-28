#include "Producer.h"


int Producer::produce(){
	
	theMutex.lock();
	srand((int)time(NULL));
	int random = rand() % 100 + 1;

	//buffer = new Buffer<int>(10);
	
	pBuffer->push(random);
	cout << "this random number was pushed ---->" << random << endl;
	
	//this_thread::sleep_for(chrono::milliseconds(100));
	theMutex.unlock();
	return random;

}

/**
void Producer::produce1() {
	srand(time(NULL));
	int random = rand() % 100 + 1;

	buffer.push(random);

	this_thread::sleep_for(chrono::milliseconds(100));
	
}
**/




