// cpp of the consumer class
#include "Consumer.h"


// required function to remove elements (integer) from the buffer and print on the console
void Consumer::consume(){
	
	


	//theMutex.lock();
	if (!pBuffer->isEmpty()) {

		int value = pBuffer->pop();

		//this_thread::sleep_for(chrono::milliseconds(300));


		cout << "this number was removed from the buffer  --******------->:" << value << endl;
	}
	else {
		cout << "Thread can not consume ,because Buffer is empty!/n" << endl;
	}
	
		//notify_all_at_thread_exit;
	//theMutex.unlock();
//	return 0;
}


