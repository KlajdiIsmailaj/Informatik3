#include "Consumer.h"



void Consumer::consume(int element){
	int value = buffer.pop();
	cout << "this random number was poped ---->" << value << endl;
	this_thread::sleep_for(chrono::milliseconds(300));

}


