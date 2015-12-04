#pragma once
// buffer class 
#include <iostream>
#include <thread>
#include <mutex>
#include <windows.h>
#include <condition_variable>
#include <chrono>

// required declarations
std::mutex theMutex;

using namespace std;

chrono::milliseconds interval(100);

// buffer class starts
template<class G>
class Buffer

{
// private declarations 
private:
	G *values;
	int top;
	
	condition_variable not_full;
	condition_variable not_empty;


// public declarations
public:
	int capacity;
	int actualsize;

	// constructor of the buffer class
	// here we parse a maximal capacity of the buffer 
public:
	Buffer(int mycapacity)
	{
		top = -1;      // means the buffer is empty
		capacity = mycapacity;
		values = new G[mycapacity];
		actualsize = 0;    // number of elements (integers) in the buffer
		//std::lock_guard<std::mutex> guard(theMutex);
	}
	// distructor of the buffer
	~Buffer() {
		delete[]values;
	}

	//**************************** PUSH FUNCTION****************************
	// adds an element (integer) into the buffer through the top
	void push(G element)
	{
		
		if (!Buffer<G>::isFull() )
		{
			this_thread::sleep_for(interval);

			while (true) {

				if (theMutex.try_lock()) {

					//top += 1;
					values[++top] = element;
					actualsize += 1;
					cout << "this number was pushed --******------->\n:" << element << endl;

					theMutex.unlock();
					return;
				}
				else {


					this_thread::sleep_for(interval);
				}



			}

		}
		else {
			cout << "thread can not produce because buffer is full!" << endl;
		}

		

	
	}	

	//*****************************POD FUNCTION*************************************
	// removes an element (integer) from the top of the buffer and returns the removed element (integer)
	G pop()
	{
	
		G val = -1;
		
		if (!Buffer<G>::isEmpty())
		
		{
			

			this_thread::sleep_for(interval);
			while (true) {

				if (theMutex.try_lock()) {

					val = values[top--];
					//top -= 1;
					actualsize = -1;

					theMutex.unlock();
					break;
					
					
				}
				else {
					
					
					this_thread::sleep_for(interval);
				}


			}


		}
		else 
		{
			cerr << "buffer is empty *****!!!!!!";
		}

		return val;
	}

	// checks if the buffer is empty
	bool isEmpty()
	{


		if (top == -1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	// checks if the buffer is full
	bool isFull()
	{
		cout <<"CAPACITY "<< capacity << endl;
		if ((top + 1) == capacity) {
		//if ((top  == capacity-1) {
		//if (capacity==actualsize) {
			cout << "THE isFull FUNCTION IS true\n:" << endl;
			return true;
			
		}
		else {
			cout << "THE isFull FUNCTION IS false\n::" << endl;
			return false;
			
		}
	}			

};