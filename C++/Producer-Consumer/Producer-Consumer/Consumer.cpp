#include "Consumer.h"



int Consumer::consume(){
	theMutex.lock();
	int value = pBuffer->pop();
	cout << "this random number was poped ---->" << value << endl;
	this_thread::sleep_for(chrono::milliseconds(300));
	theMutex.unlock();
	return 0;
}


