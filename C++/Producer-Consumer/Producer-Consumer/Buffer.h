#pragma once
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>

std::mutex theMutex;

using namespace std;

template<class G>
class Buffer

{

private:
	G *values;
	int top;
	//mutex lock;
	condition_variable not_full;
	condition_variable not_empty;
	//int number = 10;

public:
	int capacity;

public:
	Buffer(int capacity)
	{
		top = -1;
		capacity = 10;
		values = new G[capacity];
	}
	~Buffer() {
		delete[]values;
	}
	
	void push(G element)
	{

		//unique_lock << mutex > l(lock);
		//not_full.wait(l, [this]() {return top != capacity; });// TO BE VERIFIED WITH TOP 
		theMutex.lock();
		top += 1;
		values[top] = element;
		theMutex.unlock();
		//not_empty.notify_one();
	}	// push element

	G pop()
	{
		/*unique_lock << mutex > l(lock);
		not_empty.wait(l, [this]() {return top != 0; });
*/
		theMutex.lock();
		G val = -1;

		if (!Buffer<G>::isEmpty())
		//if(!this.isEmpty())
		{
			val = values[top];
			top -= 1;
		}
		else 
		{
			cerr << "buffer is empty !!!!!!";
		}

		//not_full.notify_one();
		theMutex.unlock();
		return val;
	}// pop element 

	bool isEmpty()
	{


		if (top == -1) {
			return true;
		}
		else {
			return false;
		}
	}// return true if empty.
	
	
	bool isFull()
	{
		if ((top + 1) == capacity) {
			return true;
		}
		else {
			return false;
		}
	}			// return true if full.

};