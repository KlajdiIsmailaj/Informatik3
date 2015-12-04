// main class 
#include <iostream>
#include "Buffer.h"
#include "Producer.h"
#include "Consumer.h"
#include <ctime>
#include <vector>

// declarations
using namespace std;



 
	int buff;
	

	int buffer() {
		cout << "Enter Buffer Size: ";
		cin >> buff;
		return buff;
	}

	Buffer <int> b(buffer());

 
 //initialization of the object classes producer and consumer
void Produce(void)
{
	
	Producer p(&b);
	p.produce();
	
}

void Consume(void)
{
	Consumer  W(&b);
	W.consume();
}


// main function to start the program
int main() {
	//int buff;
	int countThread = 0;
	int countThread2 = 0;

	/*cout << "Enter Buffer Size: ";
	cin >> buff;*/
	//buffer();
	cout << "Enter Producer Threads Size: ";
	cin >> countThread;
	cout << "Enter Consumer Threads Size: ";
	cin >> countThread2;

	/*Buffer <int> b(buff);
	Producer p(&b);
	Consumer  c(&b);*/
	
		 
	

	//declare the threads objects
	thread producerThreads;
	thread consumerThreads;

	// create thread 1 ( producer) with the entered number in the console (countThread)
	for (int i = 0; i < countThread; i++)
	{
		producerThreads = thread(Produce);
		cout << "Producer - Thread:" << i << endl;
		 producerThreads.join();
		

	}

	// create thread 2 ( consumer) with the entered number in the console (countThread)
	for (int i = 0; i < countThread2; i++)
	{
		consumerThreads = thread(Consume);
		cout << "CONSUMER-Thread:" << i << endl;
		consumerThreads.join();

		
	}

	
	// verrify number of elements in the buffer
	// cout << "number of element in buffer ---->" << b.actualsize << endl;

	 

	system("pause");
	return 0;
}






