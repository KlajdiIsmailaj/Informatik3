// main class 
#include <iostream>
#include "Buffer.h"
#include "Producer.h"
#include "Consumer.h"
#include <ctime>
#include <vector>
#include <algorithm>


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

void do_join(std::thread& t)
{
	t.join();
}

void join_all(std::vector<std::thread>& v)
{
	std::for_each(v.begin(), v.end(), do_join);
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
	
		 
	
	//vector<thread> threadP;
	//vector<thread> threadC;
	vector<thread> v;
	
	//declare the threads objects
	//thread producerThreads;
	//thread consumerThreads;
	
	//threadP.push_back(producerThreads);
	//threadC.push_back(consumerThreads);

	// create thread 1 ( producer) with the entered number in the console (countThread)
	for (int i = 0; i < countThread; i++)
	{

		//producerThreads = thread(Produce);
		v.push_back(thread(Produce));
		do_join(thread(Produce));
		//threadP[i].join();
		cout << "Producer - Thread:" << i << endl;
		// producerThreads.join();
		

	}

	/*for (thread &a : v) {
		do_join(a);
	}*/

	

	// create thread 2 ( consumer) with the entered number in the console (countThread)
	for (int i = 0; i < countThread2; i++)
	{
		//consumerThread = thread(Consume);
		v.push_back(thread (Consume));
		do_join(thread(Consume));
		//threadC[i].join();
		cout << "CONSUMER-Thread:" << i << endl;
		//consumerThreads.join();

		
	}
	/*for (thread &a : v) {
		do_join(a);
	}*/
	

	//join_all(v);

	//for (int i = 0; i < countThread; i++) {
	//	//producerThreads.join();
	//	v[0].join();
	//}
	//  

	//for (int i = 0; i < countThread2; i++) {
	//	//consumerThreads.join();
	//	v[1].join();
	//}
	
	// verrify number of elements in the buffer
	// cout << "number of element in buffer ---->" << b.actualsize << endl;

	 

	system("pause");
	return 0;
}






