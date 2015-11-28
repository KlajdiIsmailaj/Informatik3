#include <iostream>
#include "Buffer.h"
#include "Producer.h"
#include "Consumer.h"

using namespace std;

Buffer <int> b(10);

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

void myfunc()
{
}

int main() {
	
	

	//thread t1(p.produce,1);
	//std::thread t = thread(myfunc);
	const int anzahlThread = 5;
	std::thread producerThreads[anzahlThread];
	std::thread consumerThreads[anzahlThread];

	for (int i = 0; i < anzahlThread; i++)
	{
		producerThreads[i] = thread(Produce);
	}
	for (int i = 0; i < anzahlThread; i++)
	{
		consumerThreads[i] = thread(Consume);
	}

	/*std::thread t1 = thread(Produce);

	std::thread t2 = thread(Consume);*/


	for (int i = 0; i < anzahlThread; i++)
	{
		producerThreads[i].join();
		//consumerThreads[i].join();
	}

	for (int i = 0; i < anzahlThread; i++)
	{
		//producerThreads[i].join();
		consumerThreads[i].join();
	}

	
	/*t1.join();
	t2.join();*/
	cout << "hghg" << endl;
	
	system("pause");
	return 0;
}




