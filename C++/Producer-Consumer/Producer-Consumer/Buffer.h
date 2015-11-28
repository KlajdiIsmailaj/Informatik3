#pragma once
#include <iostream>
#include <thread>
#include <mutex>
#include<condition_variable>

using namespace std;

template<class G>
class Buffer{

private:
	G*values;
	int top;
	mutex lock;
	condition_variable not_full;
	condition_variable not_empty;



public:
	int capacity;
	int number=10;

	

public:
	Buffer();
	~Buffer();
	
	void push(G element);	// push element
	G pop();				// pop element 
	bool isEmpty();			// return true if empty.
	bool isFull();			// return true if full.

};

