// cpp class of producer
#include "Producer.h"
#include <random>
#include <functional>
#include <stdlib.h>


// required function to produce elements (integer) into the buffer 
void Producer::produce()
{
	//if (!pBuffer->isFull())
	
	//{
	//	cout << "Producer can not produce .because Buffer is full! --******------->:\n"  << endl;

		this_thread::sleep_for(chrono::milliseconds(200));

	
		// this blog generate the random element (integer)
		std::uniform_int_distribution<int> range(1, 100);
		std::random_device read;
		std::mt19937 mt(read());
		int randomInteger = range(mt);
	
	// the generated random element is parsed to the push function so it can be inserted in the buffer	
		pBuffer->push(randomInteger);
		


		this_thread::sleep_for(chrono::milliseconds(100));

	     notify_all_at_thread_exit;

		//return randomInteger;
	
	
			

	//}
	//else {
		//cout << "buffer is full" << endl;
	//}


}








